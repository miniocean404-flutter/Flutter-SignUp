# fapk_channel.sh
# Mac运行脚本 fapk_channel.sh Mi 安卓之光

# 打包后输入的路径
outPath = /Users/zero/apk/$1/

flutter build apk --dart-define=APP_CHANNEL=$1 --dart-define=OTHER_VAR=$2
cd build/app/outputs/apk/release/
cp -R *.apk ${outPath}
cd ${outPath}
open .
