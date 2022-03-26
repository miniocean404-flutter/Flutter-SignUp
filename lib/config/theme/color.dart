import 'package:flutter/material.dart';

class AppColor {
  static final fontWeight = FontWeight.w600;

  static Color primary = Color(0xfffbfbfb);
  // static Color success = Color(0xff07c160);
  static Color danger = Color(0xffee0a24);
  static Color warning = Color(0xffffba00);
  static Color info = Color(0xff00a1d6);
  // static Color active = Colors.blue;
  static Color unactive = Color(0xff7b7b7b);
  static Color un2active = Color(0xff8d8d8d);
  static Color un3active = Color(0xffb1b1b1);
  // static Color page = Color(0xfff7f7f7);
  static Color page = Color(0xFFFFFFFF);
  static Color border = Color(0xfff5f5f5);
  static Color dark = Color(0xFF000000);
  static Color transparent = Colors.transparent;

  // 颜色值转换
  static Color string2Color(String colorString) {
    int value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }

      value = int.tryParse(colorString, radix: 16)!;
      if (value < 0xFF000000) {
        value += 0xFF000000;
      }
    }

    return Color(value);
  }
}
