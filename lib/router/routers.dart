import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/utils/logger.dart';

// 函数导入
import 'route_handler.dart';
import 'setting_handler.dart';

//省略 import
class Routers {
  static final FluroRouter router = FluroRouter();

  static const String splash = "/";
  static const String home = "/home";

  // 设置界面
  static const String settingHome = "/settingHome";
  static const String settingAbout = "/settingAbout";
  static const String settingDevice = "/settingDevice";
  static const String settingNetwork = "/settingNetwork";
  static const String settingUpdate = "/settingUpdate";

  static void defineRoutes() {
    // 处理找不到页面情况
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        logger.w('没有匹配的路由!');
        return null;
      },
    );

    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(settingHome, handler: settingHomeHandler);
    router.define(settingAbout, handler: settingAboutHandler);
    router.define(settingNetwork, handler: settingNetworkHandler);
    router.define(settingDevice, handler: settingDeviceHandler);
    router.define(settingUpdate, handler: settingUpdateHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future<dynamic> navigateTo(
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
        final value = Uri.encodeComponent(params[key].toString());
        index == 0 ? paramsStr = "?" : paramsStr = paramsStr + r"&";
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
