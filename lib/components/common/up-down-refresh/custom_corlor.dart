import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

// 覆盖主题的全局自定义
class CustomAppColor {
  late Color borderColor, cubeColor;
  late Color activeNavColor;
  late Color navBarColor;
  late Color colorF3F3F6;
  late Color color202326;

  CustomAppColor.of(BuildContext context) {
    //  暗黑色
    if (isDarkMode(context)) {
      borderColor = '#f16161'.toColor();
      cubeColor = Colors.white70;
      activeNavColor = Colors.brown;
      navBarColor = '#161616'.toColor();
      colorF3F3F6 = '#18191b'.toColor();
      color202326 = '#4e5156'.toColor();
      return;
    }

    //  明亮色
    borderColor = '#dedede'.toColor();
    cubeColor = Colors.black38;
    activeNavColor = Colors.amberAccent;
    navBarColor = Colors.white;
    colorF3F3F6 = '#F3F3F6'.toColor();
    color202326 = '#202326'.toColor();
  }
}
