import 'package:flutter_sign_in/config/env/abstract_current_env.dart';

import 'env.dev.dart';
import 'env.prod.dart';

// 通过命令--dart-define=key=value
// flutter run --dart-define=APP_CHANNEL=ZeroFlutter --dart-define=ENV=dev
CurrentEnv getEnvironmentConfig() {
  const env = String.fromEnvironment('ENV');

  if (env == 'dev') {
    return EnvironmentDev();
  } else if (env == 'prod') {
    return EnvironmentProd();
  }

  throw '没有获取到对应环境的配置';
}

/// 判断是否为Debug模式
bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true); // 如果debug模式下会触发断言
  return inDebug;
}

/// 判断编译模式
String getCompileMode() {
  const bool isProfile = bool.fromEnvironment("dart.vm.profile");
  const bool isReleaseMode = bool.fromEnvironment("dart.vm.product");

  if (isDebug()) {
    return "debug";
  } else if (isProfile) {
    return "profile";
  } else if (isReleaseMode) {
    return "release";
  } else {
    return "unknown mode";
  }
}
