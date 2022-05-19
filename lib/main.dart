// 安卓使用material IOS使用 cupertino
// 与安卓的MaterialApp一样 iOS的是CupertinoApp
// 与安卓的Scaffold一样 iOS的是CupertinoPageScaffold

import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/intl/enrty_config.dart';
import 'package:flutter_sign_in/config/theme/cupertino.dart';
import 'package:provider/provider.dart';

import 'config/global.dart';
import 'provider/version.dart';
import 'router/routers.dart';

void main() async {
  await Global.initCommon();

  runApp(
    MultiProvider(
      providers: [
        // 这里通过 ChangeNotifierProvider 的 create 把 ChangeNotifier（即 Data）建立联系，
        // 作用域的范围在 child 指定的 MaterialApp，这里我们将 MyApp 作为首页，SingleStatsView 里面
        // 可以使用 Data 作为数据源。
        // 需要注意的是，不要把所有状态的作用域都放在 MaterialApp，根据实际业务需求严格控制作用域范围，
        // 全局状态多了会严重影响应用的性能。
        // 默认懒加载，需要提前处理值，就要lazy=false

        // 原生 ValueListenableBuilder 按需 rebuild https://book.flutterchina.club/chapter7/value_listenable_builder.html#_7-5-1-valuelistenablebuilder

        ChangeNotifierProvider<Version>(
          create: (context) => Version(),
          lazy: false,
        ),
      ],
      // 消费者
      child: Consumer<Version>(
        // builder 中的参数分别是 Context context、T value、Widget child，value 即Data，value 的类型和 Data 类型一致，
        // builder 方法返回的是 Widget，也就是被 Consumer 包裹的 widget，
        // 当监听的 model 值发生改变，此 widget 会被 Rebuild。

        builder: (ctx, data, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // CupertinoApp
    return CupertinoApp(
      title: '签到',
      debugShowCheckedModeBanner: false,
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
      theme: cupertinoThemeColor(),
      // darkTheme: materialDarkTheme(),
      // 路由
      initialRoute: Routers.splash,
      onGenerateRoute: Routers.router.generator,
      navigatorObservers: [Routers.routeObserver, Routers.allRouteObserver],

      builder: (context, widget) {
        Global.initScreen(context); // 初始化屏幕自适应工具

        return MediaQuery(
          // 设置文字大小不随系统设置改变（flutter screen 插件用）
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget ?? Container(),
        );
      },
    );
  }
}
