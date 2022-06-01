import 'package:flutter/foundation.dart' as foundation;

enum CurrentCompileMode {
  debug,
  profile,
  release,
}

/// 判断编译模式
CurrentCompileMode? getCompileMode() {
  const bool isProfile = bool.fromEnvironment("dart.vm.profile");
  const bool isReleaseMode = bool.fromEnvironment("dart.vm.product");

  if (isDebug()) {
    return CurrentCompileMode.debug;
  } else if (isProfile) {
    return CurrentCompileMode.profile;
  } else if (isReleaseMode) {
    return CurrentCompileMode.release;
  }

  return null;
}

// 判断编译模式2
CurrentCompileMode? getCompileMode2() {
  if (foundation.kDebugMode) {
    return CurrentCompileMode.debug;
  } else if (foundation.kProfileMode) {
    return CurrentCompileMode.profile;
  } else if (foundation.kReleaseMode) {
    return CurrentCompileMode.release;
  }

  return null;
}

/// 判断是否为Debug模式
bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true); // 如果debug模式下会触发断言
  return inDebug;
}
