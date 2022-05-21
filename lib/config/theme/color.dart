import 'package:flutter/cupertino.dart';

class AppColor {
  static Color primary = const Color(0xffFFFFFF);
  static Color secondary = const Color(0xffC1C1C1);

  static Color danger = const Color(0xffee0a24);
  static Color warning = const Color(0xffffba00);

  // static Color active = Colors.blue;
  static Color unactive = const Color(0xff7b7b7b);
  static Color un2active = const Color(0xff8d8d8d);
  static Color un3active = const Color(0xffb1b1b1);

  static Color page = const Color(0xffefeff3);
  static Color border = const Color(0xfff5f5f5);

  static Color dark = const Color(0xFF000000);
  static Color transparent = const Color.fromRGBO(0, 0, 0, 0);
  // static Color transparent = Colors.transparent;

  // 颜色值转换
  static Color string2Color(String colorString) {
    int value = 0x00000000;
    if (colorString[0] == '#') colorString = colorString.substring(1);
    value = int.tryParse(colorString, radix: 16)!;
    if (value < 0xFF000000) value += 0xFF000000;

    return Color(value);
  }
}
