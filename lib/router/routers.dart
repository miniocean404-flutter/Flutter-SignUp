import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/utils/logger.dart';
import 'route_handler.dart';

//省略 import
class Routers {
  static final FluroRouter router = FluroRouter();

  static const String splash = "/";
  static const String home = "/home";

  static void defineRoutes() {
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);

    // 处理找不到页面情况
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        logger.w('没有匹配的路由!');
        return null;
      },
    );
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(
    BuildContext context,
    String path, {
    Map<String, dynamic>? params,
    bool clearStack = false, // 是否清理页面栈
    bool replace = false,
    TransitionType transition = TransitionType.cupertino,
  }) {
    String paramsStr = "";
    if (params != null) {
      int index = 0;

      // 拼接参数
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key].toString());
        index == 0 ? paramsStr = "?" : paramsStr = paramsStr + "\\&";
        paramsStr += "$key=$value";
        index++;
      }
    }
    path = path + paramsStr;

    return router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      replace: replace,
      transition: transition,
    );
  }
}
