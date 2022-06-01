import 'package:flutter_sign_in/config/global.dart';
import 'package:flutter_sign_in/http/config/http_exception.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';

// 业务状态码情况处理
class StatusHandle {
  static final StatusHandle _instance = StatusHandle._internal();

  factory StatusHandle() => _instance;

  StatusHandle._internal();

  factory StatusHandle.code(HttpException httpException) {
    final int code = httpException.code;
    final String msg = httpException.msg;

    toast('Http错误: 状态码:$code 错误消息: $msg');

    switch (code) {
      case 401:
        // 应该跳转登录页
        final context = Global.navigatorStateKey.currentContext;
        Routers().navigateTo(context!, CustomRoute().splash);
    }

    return _instance;
  }
}
