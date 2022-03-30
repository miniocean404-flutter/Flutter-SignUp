import 'package:flutter/material.dart';
import 'package:flutter_sign_in/utils/logger.dart';
import 'package:logger/logger.dart';

import 'config/global.dart';
import 'config/theme/index.dart';
import 'router/routers.dart';

void main() {
  Global.initCommon();
  runApp(const MyApp());
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
    );
  }
}
