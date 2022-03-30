import 'package:flutter_sign_in/views/home/index.dart';
import 'package:flutter_sign_in/views/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

final splashHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Splash();
});

final homeHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Home();
});
