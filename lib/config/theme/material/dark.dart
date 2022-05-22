import 'package:flutter/material.dart';
import 'package:flutter_sign_in/components/help/water_ripple.dart';
import 'package:flutter_sign_in/config/theme/color/dark.dart';
import 'package:flutter_sign_in/config/theme/font/font_global.dart';

final ThemeData materialDarkTheme = _materialDarkColor();

TextTheme _buildTextTheme(TextTheme base) => base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );

ThemeData _materialDarkColor() {
  // 创建此配色方案的副本，并将给定字段替换为非空参数值
  final colorScheme = const ColorScheme.dark().copyWith(
    // 日夜间模式
    brightness: Brightness.dark,
    // 脚手架上面标题等主要颜色(包括文本按钮的颜色,旋转指示器)
    primary: AppColorDark.primary,
    // 黑暗主题的主色调
    primaryContainer: AppColorDark.primary,

    // 一种强调色，，有选定行时PaginatedDataTable标题的颜色（水波纹、浮动按钮）
    secondary: AppColorDark.secondary,
    secondaryContainer: AppColorDark.secondary,

    // 小部件的背景色 如:card appbar
    surface: AppColorDark.secondary,
    //可滚动内容后面的颜色
    background: AppColorDark.page,
    //用于输入验证错误的颜色，例如:InputDecoration.errorText
    error: AppColorDark.danger,

    // (按钮、AppBar) 在主色调上绘制清晰易读的字体颜色
    onPrimary: AppColorDark.unactive,
    // 在secondary上绘制清晰易读的颜色
    onSecondary: AppColorDark.un2active,
    onSurface: AppColorDark.un3active,
    onBackground: AppColorDark.unactive,
    onError: AppColorDark.danger,
  );

  final base = ThemeData(
    platform: TargetPlatform.iOS, //启动时候的平台模式，打包还是原来的模式
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      // TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
    }),
    brightness: Brightness.dark,
    // * 全局主题
    colorScheme: colorScheme,

    // 用于去除水波纹
    splashColor: AppColorDark.transparent,
    highlightColor: AppColorDark.transparent,
    splashFactory: const NoSplashFactory(),

    primaryColor: AppColorDark.primary,
    primaryColorDark: AppColorDark.dark,
    primaryColorLight: AppColorDark.secondary,

    indicatorColor: AppColorDark.primary,
    toggleableActiveColor: AppColorDark.primary,
    canvasColor: AppColorDark.dark,

    //用于materia应用程序或app内页面的背景色
    scaffoldBackgroundColor: AppColorDark.page,
    backgroundColor: AppColorDark.page,
    errorColor: AppColorDark.danger,

    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColorDark.secondary,
      labelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
      unselectedLabelColor: AppColorDark.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
    ),

    // ElevatedButton 主题
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     // 文字颜色
    //     foregroundColor: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return Colors.white;
    //       } else {
    //         return null;
    //       }
    //     }),
    //     // 背景色
    //     backgroundColor: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return DQColor.danger.withOpacity(0.5);
    //       } else {
    //         return DQColor.danger;
    //       }
    //     }),
    //   ),
    // ),

    // * 文字按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: AppColorDark.unactive)),
        //未知
        backgroundColor: MaterialStateProperty.all(AppColorDark.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(AppColorDark.secondary),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(AppColorDark.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: AppColorDark.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),

    // * 进度指示器主题
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColorDark.secondary,
    ),

    // * AppBar主题配置
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.primary,
      elevation: 1,
    ),

    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.primary,
      elevation: 0, //虚线阴影
      selectedItemColor: AppColorDark.secondary,
      unselectedItemColor: AppColorDark.unactive,
    ),
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
