import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/base.dart';
import 'package:flutter_sign_in/config/theme/color/dark.dart';
import 'package:flutter_sign_in/config/theme/color/light.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';

enum ColorMode { light, dark }

class AppColor extends AppColorBase {
  // 初始化一个单例实例
  static final AppColor _instance = AppColor._internal();

  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory AppColor() => _instance;

  late AppColorLight light;
  late AppColorDark dark;
  late dynamic currentMode;

  AppColor._internal() {
    light = AppColorLight();
    dark = AppColorDark();
  }

  AppColor.of({BuildContext? context, ColorMode mode = ColorMode.light}) {
    if (isDarkMode(context!) || mode == ColorMode.dark) {
      currentMode = dark;
      return;
    }

    currentMode = light;
  }
}
