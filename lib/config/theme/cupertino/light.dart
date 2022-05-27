import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/theme/color/app_color.dart';

final CupertinoThemeData cupertinoLightTheme = cupertinoLight();

CupertinoThemeData cupertinoLight() {
  return CupertinoThemeData(
    brightness: Brightness.light,

    // 顶部导航栏和底部标签栏的背景颜色
    scaffoldBackgroundColor: AppColor().light.page,

    // 顶部导航栏和底部标签栏的背景颜色。
    // 默认:CupertinoColors.systemGrey6 在浅色模式下默认为浅灰色，在深色模式下默认为深半透明灰色。
    // 不设置不会占位置，设置上导航条使用margin时就会占据位置
    barBackgroundColor: AppColor().light.secondary,

    // 这种颜色通常用于按钮和可点击的文本和图标
    // 默认为[CupertinoColors.activeBlue]。
    primaryColor: AppColor().light.primary,

    // 在primaryColor背景上渲染时必须易于看到的颜色 ,例如，当按钮的背景为primaryColor时，此颜色用于CupertinoButton的文本和图标。
    primaryContrastingColor: AppColor().light.buttonText,

    // 文字相关样式
    textTheme: CupertinoTextThemeData(
      // CupertinoNavigationBar 左边箭头的颜色
      primaryColor: AppColor().light.primary,

      // Cupertino 小部件的一般文本内容的 TextStyle。
      textStyle: TextStyle(
        // 是否将空值替换为其祖先文本样式中的值（例如，在 [TextSpan] 树中）
        inherit: true,

        // 绘制文本时使用的颜色。如果指定了此项，则foreground必须为空。
        color: AppColor().light.danger,

        // 用作文本背景的颜色。
        // backgroundColor: AppColor().light.danger,

        // 绘制文本时使用的字形大小（以逻辑像素为单位）
        fontSize: 16.sp,

        // 绘制文本时使用的字体粗细（例如，粗体）
        fontWeight: FontWeight.w400,

        // 绘制字母时使用的字体变体（例如，斜体）。
        fontStyle: FontStyle.normal,

        // 要在每个字母之间添加的空间量（以逻辑像素为单位）
        letterSpacing: 1.w,

        // 在每个空白序列（即每个单词之间）添加的空间量（以逻辑像素为单位）
        wordSpacing: 2.w,

        // 应在此文本跨度与其父文本跨度之间对齐的公共基线，或者对于根文本跨度，应与行框对齐 ideographic基于文字对齐另一个基于字母对齐
        textBaseline: TextBaseline.ideographic,

        // 此文本跨度的高度，作为字体大小的乘数。省略height将允许行高采用字体定义的高度，这可能不完全是 fontSize 的高度。
        // height: 1.h,

        // height指定时，额外的垂直空间应如何分布在文本上方和下方。如果未指定，则默认为段落的TextHeightBehavior
        // leadingDistribution:ui.TextHeightBehavior() ,

        // 用于选择区域特定字形的语言环境。
        // locale,

        // 用于绘制文本的颜料。如果指定了此项，则color必须为空
        // foreground,

        // 作为文本背景绘制的颜料。
        // background:Paint(),

        // 阴影
        // shadows,

        // 应该应用于文本的字体特征。
        // fontFeatures:const [ui.FontFeature],

        // 要在文本附近绘制的装饰（例如，下划线）
        // decoration,

        // 用于绘制文本装饰的颜色
        // decorationColor,

        // 绘制文本装饰的样式（例如，虚线）
        // decorationStyle,

        // 装饰的粗细作为字体指定粗细的乘数
        decorationThickness: 1,

        // debug标志
        debugLabel: 'debug标志 no debug',

        // 绘制文本时使用的字体名称（例如，Roboto）。
        // 如果提供了 afontFamilyFallback而fontFamily没有提供，则其中的第一个字体系列fontFamilyFallback将占据首选字体系列的位置。
        // 当无法找到较高优先级的字体或不包含字形时，将使用较低优先级的字体
        fontFamily: 'GoogleSans',

        //  当在更高优先级字体中找不到字形时要回退的字体名称的有序列表。
        //  当fontFamily为空时，此列表中的第一个字体系列用作首选字体。
        //  在内部，'fontFamily is concatenated to the front of this list. When no font family is provided through 'fontFamilyFallback' (null or empty) orfontFamily`，
        //  然后将使用平台默认字体
        // fontFamilyFallback,

        // 如果字体是在包中定义的，则包参数必须为非空。它与 fontFamily 参数结合来设置 [fontFamily] 属性
        // package,

        //  修剪行为
        // clipBehavior,
      ),

      // 交互式文本内容的 TextStyle，例如没有背景的按钮中的文本
      // actionTextStyle:,

      // 未选中选项卡的 TextStyle
      // tabLabelTextStyle:,

      // 标准导航栏中标题的 TextStyle
      // navTitleTextStyle:,

      // 长条导航栏中大标题的 TextStyle。
      // navLargeTitleTextStyle:,

      // 导航栏中交互式文本内容的 TextStyle
      // navActionTextStyle:,

      // 选择器的 TextStyle
      // pickerTextStyle:,

      // 日期选择器的 TextStyle
      // dateTimePickerTextStyle:,
    ),
  );
}
