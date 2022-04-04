import 'dart:math';

import 'dev.dart';
import 'prod.dart';
import 'staging.dart';

// 通过命令--dart-define=key=value
// flutter run --dart-define=APP_CHANNEL=ZeroFlutter --dart-define=ENV=dev
Object getEnvironmentConfig() {
  const env = String.fromEnvironment('ENV');

  if (env == 'dev') {
    return EnvironmentDev();
  } else if (env == 'prod') {
    return EnvironmentProd();
  } else if (env == 'staging') {
    return EnvironmentStaging();
  }

  throw '没有获取到对应环境的配置';
}
