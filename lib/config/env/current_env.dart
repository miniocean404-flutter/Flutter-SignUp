import 'dev.dart';
import 'prod.dart';
import 'staging.dart';

// 通过命令--dart-define=key=value
// flutter run --dart-define=APP_CHANNEL=ZeroFlutter --dart-define=ENV=dev
Object getEnvironmentConfig() {
  // 当App运行在Release环境时，inProduction为true，为生产环境；当App运行在Debug和Profile环境时，inProduction为false
  // ignore: unused_local_variable
  const bool isPrd = bool.fromEnvironment("dart.vm.product");

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

/// 判断是否为Debug模式
bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true);
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
    return "Unknown type";
  }
}
