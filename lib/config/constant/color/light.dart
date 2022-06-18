import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/constant/color/current_mode_color.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

class AppColorLight extends CurrentModeColor {
  AppColorLight() {
    primary = '#409eff'.toColor();

    // 主要用于背景色上的一块一块卡片
    secondary = '#FFFFFf'.toColor();

    // 页面颜色
    page = '#efeff3'.toColor();
    buttonText = '#FFFFFf'.toColor();

    danger = '#ee0a24'.toColor();
    warning = '#ffba00'.toColor();

    active = '#18191b'.toColor();
    unactive = '#7b7b7b'.toColor();
    un2active = '#8d8d8d'.toColor();
    un3active = '#b1b1b1'.toColor();

    // 边框颜色
    border = '#dedede'.toColor();

    black = '#000000'.toColor();
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
