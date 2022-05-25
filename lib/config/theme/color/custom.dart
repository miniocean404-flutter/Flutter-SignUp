import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';

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
      borderColor = const Color(0xfff16161);
      cubeColor = Colors.white70;
      activeNavColor = Colors.brown;
      navBarColor = const Color(0xff161616);
      colorF3F3F6 = const Color(0xff18191b);
      color202326 = const Color(0xff4e5156);
      return;
    }

    //  明亮色
    borderColor = const Color(0xffdedede);
    cubeColor = Colors.black38;
    activeNavColor = Colors.amberAccent;
    navBarColor = Colors.white;
    colorF3F3F6 = const Color(0xffF3F3F6);
    color202326 = const Color(0xff202326);
  }
}
