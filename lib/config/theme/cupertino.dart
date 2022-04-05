import 'package:flutter/cupertino.dart';
import 'color.dart';

CupertinoThemeData cupertinoThemeColor() {
  return CupertinoThemeData(
    brightness: Brightness.light,
    // 用于主题的交互元素的颜色。
    primaryColor: AppColor.info,
    // 在primaryColor背景上渲染时必须易于看到的颜色
    primaryContrastingColor: AppColor.primary,
    textTheme: const CupertinoTextThemeData(
        // primaryColor: CupertinoColors.systemBlue,
        // textStyle:,
        // actionTextStyle:,
        // tabLabelTextStyle:,
        // navTitleTextStyle:,
        // navLargeTitleTextStyle:,
        // navActionTextStyle:,
        // pickerTextStyle:,
        // dateTimePickerTextStyle:,
        ),

    // 顶部导航栏和底部标签栏的背景颜色。
    // 在浅色模式下默认为浅灰色，在深色模式下默认为深半透明灰色。
    // barBackgroundColor: CupertinoColors.systemGrey,
    // app内页面的背景色
    // scaffoldBackgroundColor: AppColor.page,
  );
}
