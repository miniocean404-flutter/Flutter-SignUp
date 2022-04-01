import 'package:flutter/material.dart';
import 'package:flutter_sign_in/utils/logger.dart';
import 'package:provider/provider.dart';

import 'config/global.dart';
import 'config/theme/index.dart';
import 'provider/data.dart';
import 'router/routers.dart';

void main() {
  Global.initCommon();

  runApp(
    MultiProvider(
      providers: [
        // 这里通过 ChangeNotifierProvider 的 create 把 ChangeNotifier（即 Data）建立联系，
        //作用域的范围在 child 指定的 MaterialApp，这里我们将 MyApp 作为首页，SingleStatsView 里面
        //可以使用 Data 作为数据源。
        //需要注意的是，不要把所有状态的作用域都放在 MaterialApp，根据实际业务需求严格控制作用域范围，
        //全局状态多了会严重影响应用的性能。

        ChangeNotifierProvider<Data>(create: (_) => Data()),
      ],
      // 消费者
      child: Consumer<Data>(
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
    return MaterialApp(
      title: '签到',
      debugShowCheckedModeBanner: false,
      theme: themeColor(),
      darkTheme: darkTheme(),
      initialRoute: Routers.splash,
      onGenerateRoute: Routers.router.generator,
      builder: (context, widget) {
        Global.initScreen(context); // 初始化屏幕自适应工具
        Global.initSp();

        return MediaQuery(
          // 设置文字大小不随系统设置改变（flutter screen 插件用）
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget as Widget,
        );
      },
    );
  }
}
