[文章地址](https://guoshuyu.cn/home/wx/Flutter-14.html)

## 打包

一般跨平台混合开发会有两种选择：

1、将 Flutter 整体框架依赖和打包脚本都集成到主项目中。\
2、以 aar 的完整库集成形式添加到主项目。
两种实现方法各有利弊：

第一种方式可以更方便运行时修改问题，但是对主项目“污染”会比较高，同时改动会大一些。

第二种方式 需要单独调试后，更新 aar 文件再集成到项目中调试，但是这类集成方式更干净，同时 Flutter 相关代码可独立运行测试，且改动较小。

一般而言，对于普通项目我是建议以 第二种方式集成到项目中的 ，通过新建一个 Flutter 工程，然后对工程进行组件化脚本处理，让它 既能以 apk 形式单独运行调试，又能打包为 aar 形式对外提供支持。

相信对于原生平台熟悉的应该知道，我们可以通过简单修改项目 gradle 脚本，让它快速支持这个能力，如下图片所示，图片中为省略的部分脚本代码，完整版可见 \
[flutter_app_lib](https://github.com/CarGuo/flutter_app_lib) 。

我们通过了 isLib 标记为去简单实现了项目的打包判断，当项目作为 lib 发布时，设置 isLib 为 true，之后执行 ./gradlew assembleRelease 即可 ，剩下的工作依旧是 Flutter 自身的打包流程，而对于打包后的 aar 文件直接在原生项目里引入即可完成依赖。

而一般接入时，如果需要 token 、用户数据等信息，推荐提供定义好原生接口，如 init(String token, String userInfo) 等，然后通过 MethodChannel 将信息同步到 Flutter 中。

对于原生主工程，只需要接入 aar 文件，完成初始化并打开页面，而无需关心其内部实现，和引入普通依赖并无区别。

你可能需要修改的还有 AndroidManifset 中的启动 MainActivity 移除，然后添加一个自定义 Activity 去继承 FlutterActivity 完成自定义。

![图片]('http://img.cdn.guoshuyu.cn/20190604_Flutter-14/image1')

## 插件

#### react-native

如果普通情况下，到上面就可以完成 Flutter 的集成工作了，但是往往事与愿违，一些 Flutter 插件在提供功能时，往往是通过原生层代码实现的，如 flutter_webview 、android_intent 、device_info 等等，那这些代码是怎么被引用的呢？

这里稍微提一下，用过 React Native 的应该知道，带有原生代码的 React Native 插件，在 npm 安装以后，需要通过 react-native link 命令完成安装处理。 这个命令会触发脚本修改原生代码，从而修改 gradle 脚本增加对插件项目的引用，同时修改 java 代码实现插件的模版引入，这使得项目在一定程度被插件“污染”。

在 React Native 中带有原生代码的插件，会被以本地 Module 工程的方式引入，那 Flutter 呢？

#### Flutter

其实原理上 Flutter 带有原生代码的插件，在插件安装后，也是会以本地 Module Project 的形式引入 ，但是它整个过程更加巧妙，让开发中对这个过程几乎无感。

如下图所示，不知道你注意过没有，在插件安装之后，所有带原生代码的插件，都会以路径和插件名的 key=value 形式 存在 .flutter-plugins 文件中。

而在 android 工程的 settings.gradle 里，如下图所示，会通过读取该文件将 .flutter-plugins 文件中的项目一个个 include 到主工程里。

之后就是主工程里的 apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle" 脚本的引入了，这个脚本一般在于 flutterSDK/packages/flutter_tools/gradle/ 目录下，如下代码所示，其中最关键的部分同样是 读取 .flutter-plugins 文件中的项目，然后一个一个再 implementation 到主工程里完成依赖。

自此所有原生代码的 Flutter 插件，都被作为本地 Module Project 的形式引入主工程了 ，最后脚本会自动生成一个 GeneratedPluginRegistrant.java 文件，实现原生代码的引用注册， 而这个过程对你完全是无感的。

说了那么多就是为了说明，既然插件是被当作本地 Module Project 的形式引入，那么这时候按照原来直接打包 aar 是会有问题的：

#### fat-aar

`Android` 默认 `gradle` 脚本打包时，对于 `project` 和远程依赖只会打包引用而不会打包源码和资源。
所以这时候就需要 fat-aar 的加持了，关于 fat-aar 的详细概念可见 ：《从 Android 到 React Native 开发（四、打包流程解析和发布为 Maven 库）》 ，这里可以简单理解为，这是一个支持将引用代码和资源到合并到一个 aar 的插件。

如下代码所示，我们在原本的组件化脚本上，通过增加 apply plugin: 'com.kezong.fat-aar' 引入插件，然后参考 Flutter 脚本对 .flutter-plugins 文件中的项目进行 embed 依赖引用即可 ，这时候再打包出的 aar 文件即为完整 Flutter 项目代码。
