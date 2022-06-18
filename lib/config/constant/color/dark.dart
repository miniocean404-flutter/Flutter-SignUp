import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/constant/color/current_mode_color.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

class AppColorDark extends CurrentModeColor {
  AppColorDark() {
    primary = '#409eff'.toColor();
    secondary = '#222222'.toColor();

    // page = '#202124'.toColor();
    page = '#000000'.toColor();
    buttonText = '#FFFFFf'.toColor();

    danger = '#ee0a24'.toColor();
    warning = '#ffba00'.toColor();

    active = '#18191b'.toColor();
    unactive = '#d2d5dd'.toColor();
    un2active = '#8d8d8d'.toColor();
    un3active = '#b1b1b1'.toColor();
    border = '#202124'.toColor();

    black = '#000000'.toColor();
    transparent = const Color.fromRGBO(0, 0, 0, 0);
  }
}
