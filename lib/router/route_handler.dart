import 'package:flutter_sign_in/views/home/index.dart';
import 'package:flutter_sign_in/views/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var splashHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Splash();
});

var homeHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Home();
});
