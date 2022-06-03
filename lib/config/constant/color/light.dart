import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/constant/color/current_mode_color.dart';

class AppColorLight extends CurrentModeColor {
  AppColorLight() {
    primary = const Color(0xff409eff);

    // 主要用于背景色上的一块一块卡片
    secondary = const Color(0xffFFFFFf);

    // 页面颜色
    page = const Color(0xffefeff3);
    buttonText = const Color(0xffFFFFFf);

    danger = const Color(0xffee0a24);
    warning = const Color(0xffffba00);

    active = const Color(0xff18191b);
    unactive = const Color(0xff7b7b7b);
    un2active = const Color(0xff8d8d8d);
    un3active = const Color(0xffb1b1b1);

    // 边框颜色
    border = const Color(0xffdedede);

    black = const Color(0xFF000000);
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
