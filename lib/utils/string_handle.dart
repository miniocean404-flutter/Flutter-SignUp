import 'dart:math' as math;

/// 对比版本 version1 是否大于 version2
bool versionCompare(String version1, String version2) {
  final List<int> v1 = version1.split('.').map((e) => int.parse(e)).toList();
  final List<int> v2 = version2.split('.').map((e) => int.parse(e)).toList();

  final int num = math.min(v1.length, v2.length);

  bool result = false;
  for (var i = 0; i < num; i++) {
    if (v1[i] > v2[i]) {
      result = true;
      break;
    }
    if (v1[i] < v2[i]) {
      result = false;
      break;
    }

    result = false;
  }

  return result;
}
