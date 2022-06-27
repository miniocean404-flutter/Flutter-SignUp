import 'package:flutter/material.dart';
import 'package:flutter_sign_in/provider/busin_status.dart';
import 'package:flutter_sign_in/provider/version.dart';
import 'package:provider/provider.dart';

MultiProvider initProvider(Widget app) {
  return MultiProvider(
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
      ChangeNotifierProvider<BusinStatus>(
        create: (context) => BusinStatus(),
        lazy: false,
      ),
    ],
    // 消费者
    child: Consumer<Version>(
      // 决定 ChangeNotifierProvider 中数据变化时候重新刷新的颗粒度
      // builder 中的参数分别是 Context context、T value、Widget child，value 即Data，value 的类型和 Data 类型一致，
      // builder 方法返回的是 Widget，也就是被 Consumer 包裹的 widget，
      // 当监听的 model 值发生改变，此 widget 会被 Rebuild。

      builder: (context, data, child) {
        return app;
      },
    ),
  );
}
