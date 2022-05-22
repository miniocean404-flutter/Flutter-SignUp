import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/theme/color/light.dart';

CupertinoThemeData cupertinoThemeColor = _cupertinoThemeColor();

CupertinoThemeData _cupertinoThemeColor() {
  return CupertinoThemeData(
    brightness: Brightness.light,

    /**
     * app内页面的背景色
     */
    scaffoldBackgroundColor: AppColorLight.page,

    /**
     * 顶部导航栏和底部标签栏的背景颜色。
     * 默认:在浅色模式下默认为浅灰色，在深色模式下默认为深半透明灰色。
     */
    // 设置后会导致位置下坠
    // barBackgroundColor: CupertinoColors.systemGrey6,

    /**
     *  用于主题的交互元素的颜色。
     *  Icon、Text
     */
    primaryColor: AppColorLight.primary,

    /**
     * 在primaryColor背景上渲染时必须易于看到的颜色。
     *  Text文字颜色
     */
    primaryContrastingColor: AppColorLight.primary,

    /**
     * 文字相关样式
     */
    textTheme: const CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemBlue,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff000000),
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
