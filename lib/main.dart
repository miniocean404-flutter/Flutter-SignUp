// 安卓使用material IOS使用 cupertino
// 与安卓的MaterialApp一样 iOS的是CupertinoApp
// 与安卓的Scaffold一样 iOS的是CupertinoPageScaffold

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sign_in/config/intl/enrty_config.dart';
import 'package:flutter_sign_in/config/theme/cupertino/index.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';
import 'package:flutter_sign_in/config/theme/material/dark.dart';
import 'package:flutter_sign_in/config/theme/material/light.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:flutter_sign_in/utils/plugin/provider.dart';
import 'package:flutter_sign_in/utils/plugin/ume.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'config/global.dart';

void main() {
  sentryInit(() async {
    await Global.initCommon();

    final Widget app = initUme(const MyApp(), disabled: false);
    runApp(initProvider(app));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CupertinoApp
    return MaterialApp(
      navigatorKey: Global.navigatorStateKey,
      title: '签到',
      debugShowCheckedModeBanner: false, // 右上角有一个DEBUG的标识
      debugShowMaterialGrid: false, // debug 模式是否展示基线像素网格
      showSemanticsDebugger: false, // 打开显示可拜访性信息的叠加层，展现组件之间的关系、占位大小
      showPerformanceOverlay: false, // 打开性能检测 web 不可开启,否则无法启动
      checkerboardRasterCacheImages: false, // 关上栅格缓存图像的棋盘格警告 web 不可开启,否则无法启动
      checkerboardOffscreenLayers: false, // 关上渲染到屏幕外位图的层的棋盘格警告 web 不可开启,否则无法启动

      // 国际化
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      // onGenerateTitle: (context) {
      // 此时context在Localizations的子树中，
      // https://book.flutterchina.club/chapter13/faq.html#_13-4-2-%E5%A6%82%E4%BD%95%E5%AF%B9%E5%BA%94%E7%94%A8%E6%A0%87%E9%A2%98%E8%BF%9B%E8%A1%8C%E5%9B%BD%E9%99%85%E5%8C%96
      //   return S.of(context).title('国际化动态标题');
      // },

      // 主题
      theme: materialLightTheme,
      darkTheme: materialDarkTheme,
      themeMode: ThemeMode.system, // 设置日间夜间模式、或者跟随系统

      // 路由
      initialRoute: CustomRoute().splash,
      onGenerateRoute: Routers().generator, // 在routes查找不到时，会调用该方法
      navigatorObservers: [SentryNavigatorObserver(), Routers().routeObserver, Routers().allRouteObserver],

      // ignore: todo
      //todo 待查阅、将物理键盘事件绑定到用户界面中的操作
      shortcuts: <ShortcutActivator, Intent>{
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent()
      },

      // MaterialApp 会返回一个 home 或者 router 的页面, 页面中所有的 widget 都会被其包裹
      builder: EasyLoading.init(
        builder: (context, widget) {
          Global.dynamicInit(context);

          // Builder(构造器) 只是一个 StatelessWidget widget
          // 可以让 MaterialApp 后代 使用 CupertinoPageScaffold 但是 使用的是 MaterialApp Scaffold 的样式
          // 想要使用 CupertinoPageScaffold 的样式 就要加上 CupertinoTheme 包裹
          return Material(
            // CupertinoTheme 是 iOS 的 Theme 是 Android 的
            child: CupertinoTheme(
              data: cupertinoTheme(isDarkMode(context)),
              child: MediaQuery(
                // 处理屏幕旋转之后 ScreenUtil.init 的值及时修正
                key: ObjectKey(MediaQuery.of(context).orientation),
                // 设置文字大小不随系统设置改变（flutter screen 插件用）
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget ?? Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}
