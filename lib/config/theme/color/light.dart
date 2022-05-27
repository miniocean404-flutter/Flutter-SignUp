import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/theme/color/current_mode_color.dart';

class AppColorLight extends CurrentModeColor {
  AppColorLight() {
    primary = const Color(0xff409eff);

    secondary = CupertinoColors.systemGrey6;

    danger = const Color(0xffee0a24);
    warning = const Color(0xffffba00);

    active = const Color(0xff18191b);
    unactive = const Color(0xff7b7b7b);
    un2active = const Color(0xff8d8d8d);
    un3active = const Color(0xffb1b1b1);

    page = const Color(0xffefeff3);
    border = const Color(0xfff5f5f5);
    black = const Color(0xFF000000);
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
