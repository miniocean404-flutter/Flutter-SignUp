// 是否深色模式, 可判断是否是夜间模式来设置自定义颜色
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
