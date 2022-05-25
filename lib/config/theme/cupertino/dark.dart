import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/theme/color/dark.dart';

final CupertinoThemeData cupertinoDarkTheme = cupertinoDark();

CupertinoThemeData cupertinoDark() {
  return CupertinoThemeData(
    brightness: Brightness.dark,

    // app内页面的背景色
    scaffoldBackgroundColor: AppColorDark.page,

    // 顶部导航栏和底部标签栏的背景颜色。
    // 默认:在浅色模式下默认为浅灰色，在深色模式下默认为深半透明灰色。
    // 设置后会导致位置下坠
    // barBackgroundColor: CupertinoColors.systemGrey6,

    //  用于主题的交互元素的颜色 Icon
    primaryColor: AppColorDark.primary,

    // 在primaryColor背景上渲染时必须易于看到的颜色 , Text文字颜色
    primaryContrastingColor: AppColorDark.primary,

    // 文字相关样式
    textTheme: const CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemGrey,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
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
