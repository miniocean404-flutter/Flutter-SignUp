import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/constant/index.dart';

final CupertinoThemeData cupertinoDarkTheme = cupertinoDark();

CupertinoThemeData cupertinoDark() {
  return CupertinoThemeData(
    brightness: Brightness.dark,

    // 顶部导航栏和底部标签栏的背景颜色
    scaffoldBackgroundColor: AppColor().dark.page,

    // 顶部导航栏和底部标签栏的背景颜色。
    // 默认:在浅色模式下默认为浅灰色，在深色模式下默认为深半透明灰色。
    // 设置后会导致位置下坠
    barBackgroundColor: AppColor().dark.secondary,

    // 这种颜色通常用于按钮和可点击的文本和图标
    // 默认为[CupertinoColors.activeBlue]。
    primaryColor: AppColor().dark.primary,

    // 在primaryColor背景上渲染时必须易于看到的颜色 ,例如，当按钮的背景为primaryColor时，此颜色用于CupertinoButton的文本和图标。
    primaryContrastingColor: AppColor().dark.buttonText,

    // 文字相关样式
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemBlue,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor().dark.danger,
        fontFamily: 'Ping fang SC',
      ),
      // actionTextStyle:,
      // tabLabelTextStyle:,
      // navTitleTextStyle:,
      // navLargeTitleTextStyle:,
      // navActionTextStyle:,
      // pickerTextStyle:,
      // dateTimePickerTextStyle:,
    ),
  );
}
