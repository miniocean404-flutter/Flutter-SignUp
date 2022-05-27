import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/base.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';

enum ColorMode { light, dark }

class AppColor extends AppColorBase {
  late Color primary;
  late Color secondary;

  late Color danger;
  late Color warning;

  late Color active;
  late Color unactive;
  late Color un2active;
  late Color un3active;

  late Color page;
  late Color border;

  late Color dark;
  late Color transparent;

  AppColor.of({BuildContext? context, ColorMode mode = ColorMode.light}) {
    //  暗黑色
    if (isDarkMode(context!)) {
      primary = const Color(0xFF222222);
      secondary = const Color(0xffee0a24);
      danger = const Color(0xffee0a24);
      warning = const Color(0xffffba00);

      active = const Color(0xff18191b);
      unactive = const Color(0xffd2d5dd);
      un2active = const Color(0xff8d8d8d);
      un3active = const Color(0xffb1b1b1);

      page = const Color(0xFF202124);
      border = const Color(0xFF000000);
      dark = const Color(0xFF000000);
      transparent = const Color.fromRGBO(0, 0, 0, 0);
      return;
    }

    //  明亮色
    primary = const Color(0xff409eff);
    secondary = const Color(0xffC1C1C1);

    danger = const Color(0xffee0a24);
    warning = const Color(0xffffba00);

    active = const Color(0xff18191b);
    unactive = const Color(0xff7b7b7b);
    un2active = const Color(0xff8d8d8d);
    un3active = const Color(0xffb1b1b1);

    page = const Color(0xffefeff3);
    border = const Color(0xfff5f5f5);
    dark = const Color(0xFF000000);
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
