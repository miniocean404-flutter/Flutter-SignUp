import 'package:flutter/foundation.dart' as foundation;

/// 判断编译模式
const bool isDebug = foundation.kDebugMode || false;
const bool isProfileMode = foundation.kProfileMode || bool.fromEnvironment("dart.vm.profile");
const bool isRelease = foundation.kReleaseMode || bool.fromEnvironment("dart.vm.product");

/// 判断是否为Debug模式原理
bool isDebugMode() {
  bool inDebug = false;
  assert(inDebug = true); // 如果debug模式下会触发断言
  return inDebug;
}
