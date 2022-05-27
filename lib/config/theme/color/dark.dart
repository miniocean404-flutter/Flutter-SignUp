import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/current_mode_color.dart';

class AppColorDark extends CurrentModeColor {
  AppColorDark() {
    primary = const Color(0xff409eff);
    secondary = const Color(0xFF222222);

    // page = const Color(0xFF202124);
    page = const Color(0xFF000000);
    buttonText = const Color(0xffFFFFFf);

    danger = const Color(0xffee0a24);
    warning = const Color(0xffffba00);

    active = const Color(0xff18191b);
    unactive = const Color(0xffd2d5dd);
    un2active = const Color(0xff8d8d8d);
    un3active = const Color(0xffb1b1b1);
    border = const Color(0xFF202124);

    black = const Color(0xFF000000);
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
