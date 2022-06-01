import 'package:flutter_sign_in/config/env/abstract_current_env.dart';

import 'env.dev.dart';
import 'env.prod.dart';

// 通过命令--dart-define=key=value
// flutter run --dart-define=APP_CHANNEL=ZeroFlutter --dart-define=ENV=dev
CurrentEnv getEnvironmentConfig() {
  const env = String.fromEnvironment('ENV');
  const channel = String.fromEnvironment('CHANNEL');

  if (env == 'dev') {
    return EnvironmentDev(channel);
  } else if (env == 'prod') {
    return EnvironmentProd();
  }

  throw '没有获取到对应环境的配置';
}
