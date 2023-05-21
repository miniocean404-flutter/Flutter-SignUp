#!/bin/sh

# 当前工程绝对路径
project_path=$(pwd)

# XCode build 出来的APP文件有所优化，比 Flutter build ios 的 Runner.app 要小


#------------------必须修改：XCODE工程导出路径----------------#
# 目录在 Xcode -> Preferences（快捷键 command + ,） -> Locations 自定义的话在上面基础上 选择 Custom -> Relative to Workspace
# 可在路径中 ~/Library/Developer/Xcode/DerivedData/ 的文件夹里查看对应的 info.plist 文件

# Xcode 的缓存目录
# 可使用命令：xcodebuild -project Runner.xcodeproj -showBuildSettings -destination "generic/platform=iOS" 查看 -json 以json 形式查看其中的 BUILD_DIR
# Xcode 中使用 Product -> Show Build Folder in Finder

# 上述命令中的 build_dir 是打包目录
# Xcode_runner_path=~/Library/Developer/Xcode/DerivedData/Runner-ecduyvhxvpunmbfrflanxlsnblwf/Build/Products/Release-iphoneos/Runner.app
Xcode_runner_path=${project_path}/build/ios/iphoneos/Runner.app

#-------------------可选：自己的plist配置路径------------------#
# export_plist_path=${project_path}/shell/scriptTest.plist
export_plist_path=${project_path}/ios/Runner/info.plist

#-------------------可选：修改为自己的APP名称------------------#
app_name="flutter-签到"

#----------------可选：将 Runner 替换成自己的工程名(.xcodeproj 文件)---------------#
project_name=Runner

#----------------可选：将Runner替换成自己的 sheme 名--------------#
scheme_name=Runner

# 打包模式 Debug/Release/Profile
development_mode=Release

# 导出.ipa文件所在路径
ipa_path=${project_path}/prod/ipa/

# 导出签名.ipa文件所在路径
sign_path=${ipa_path}/sign

# 导出未签名.ipa文件所在路径
unsign_path=${ipa_path}/unsign

# 导出未签名.Payload文件所在路径
unsign_payload_path=${unsign_path}/Payload


# 是否执行 flutter clean
clean_tips="执行flutter clean(默认:n) [ y/n ]"
echo $clean_tips
read  -t 5 is_clean
if [  ! -n "${is_clean}" ];then
	is_clean="n"
fi

while([[ $is_clean != "y" ]] && [[ $is_clean != "n" ]])
do
  echo "错误!只能输入[ y/n ] ！！！"
  echo $clean_tips
  read is_clean
done


# 选择打包模式
echo "请输入选择模式(默认:0) [ UnSign: 0 AdHoc: 1 ] "
read  -t 5 number
if [  ! -n "${number}" ];then
	number=0
fi

while([[ $number != 0 ]] && [[ $number != 1 ]])
do
  echo "错误!只能输入0或者1！！！"
  echo "请输入选择模式? [ UnSign: 0 AdHoc: 1 ] "
  read number
done



if [ ${is_clean} = "y" ];then
  echo "=============== 开始清理 ==============="
	flutter clean
fi



echo "=============== 构建FLUTTER_IOS工程 ==============="
# --obfuscate 混淆 --split-debug-info 将因混淆生成的 map 符号表缓存到此位置 --no-codesign 没有签名的包
# flutter build ios --release --no-codesign --obfuscate --split-debug-info=./symbols
# --no-codesign 会导致不能进行安装
if [ $number == 0 ];then
  flutter build ios --dart-define ENV=dev --release  --split-debug-info=./symbols
else
  flutter build ios --dart-define ENV=dev --release  --split-debug-info=./symbols
fi



# 如果有 product/ipa 文件夹则删除，然后再创建一个空文件夹
if [ -d ${ipa_path} ]; then
  rm -rf ${ipa_path}
fi
#创建目录
mkdir -p ${ipa_path}

#rm -rf ${ipa_path}



if [ $number == 0 ];then
  echo "=============== 正在编译 XCODE 工程: ${development_mode} ==============="
  # 无签名打包 workspace 构建工作区(.xcworkspace)
  # project构建项目(.xcodeproj文件)
  # workspace:指定工作空间文件 scheme:是编译任务
  # configuration:build setting 的变体,指的是编译设置，默认有两个( release 、debug )
  # sdk:指定编译的sdk
  # 打包当前项目 ios 目录下的 xcworkspace 到 Xcode_runner_path 中
  xcodebuild build -workspace ios/${project_name}.xcworkspace -scheme ${scheme_name} -configuration ${development_mode}

  mkdir -p ${unsign_payload_path}
  cp -r ${Xcode_runner_path} ${unsign_payload_path}
  cd ${unsign_path}

  echo "=============== 读取APP信息 ==============="

  #info.plist路径
  info_plist="Payload/Runner.app/info.plist"
  # 读取 CFBundleShortVersionString
  version=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$info_plist")
  # 读取 CFBundleVersion
  build=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$info_plist")
  time=$(date "+%Y-%m-%d_%H:%M:%S")

  appName="$app_name""_v$version""_b$build""_$time.ipa"

  echo "=============== 优化Framework大小(删除符号) ==============="
  # 移除调试符号表，就是 Xcode debug 时候看不到堆栈名字
  # xcrun strip -x -S App.framework/App

  echo "=============== 生成IPA(压缩Payload文件并修改文件名为IPA) ==============="
  zip -r ${appName} *

  if [ -e $unsign_path/$appName ]; then
    echo "=============== IPA包已导出:$unsign_path/$appName ==============="
    open $unsign_path
  else
    echo '=============== IPA包导出失败 ==============='
    exit 1
  fi

else
  # Ad hoc 打包
  # -archivePath 归档文件导出的路径
  echo "=============== 正在编译工程:${development_mode} ==============="
  xcodebuild \
  archive -workspace ${project_path}/ios/${project_name}.xcworkspace \
  -scheme ${scheme_name} \
  -configuration ${development_mode} \
  -archivePath ${ipa_path}/${project_name}.xcarchive  -quiet  || exit

  echo ''
  echo '=============== 开始 IPA 打包 ==============='
  # -exportArchive 指定应导出存档  exportPath 指定从存档导出的产品的目的地 exportOptionsPlist 指定配置存档导出的 plist 文件的路径
  xcodebuild -exportArchive -archivePath ${ipa_path}/${project_name}.xcarchive \
  -configuration ${development_mode} \
  -exportPath ${sign_path} \
  -exportOptionsPlist ${export_plist_path} \
  -quiet || exit

  if [ -e $sign_path/$app_name.ipa ]; then
    echo "=============== IPA包已导出: $sign_path/$app_name.ipa ==============="
    open $sign_path
  else
    echo '=============== IPA包导出失败 ==============='
    exit 1
  fi
fi


exit 0