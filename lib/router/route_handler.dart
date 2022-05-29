import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:flutter_sign_in/views/home/index.dart';
import 'package:flutter_sign_in/views/splash.dart';

final splashHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Splash();
});

final homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Home();
});

// 404页面
final page404Handler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  logger.w('没有匹配的路由!');

  return Material(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('404页面'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('404', style: Theme.of(context!).textTheme.headline4),
            CupertinoButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back'),
            )
          ],
        ),
      ),
    ),
  );
});
