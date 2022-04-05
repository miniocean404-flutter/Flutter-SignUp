import 'package:flutter/material.dart';
import 'package:flutter_sign_in/utils/water_ripple.dart';
import 'color.dart';

// 全局主题配置
class ColorSchemeConfig {
  static ColorScheme colorScheme({mode = Brightness.light}) {
    return ColorScheme(
      brightness: mode,
      // 脚手架上面标题等主要颜色(包括文本按钮的颜色,旋转指示器)
      primary: AppColor.primary,
      // 黑暗主题的主色调
      primaryContainer: AppColor.dark,

      // 一种强调色，，有选定行时PaginatedDataTable标题的颜色（水波纹、浮动按钮）
      secondary: AppColor.info,
      secondaryContainer: AppColor.info,

      // 小部件的背景色 如:card appbar
      surface: AppColor.info,
      //可滚动内容后面的颜色
      background: Colors.green,
      //用于输入验证错误的颜色，例如:InputDecoration.errorText
      error: AppColor.danger,

      //(按钮、AppBar) 在主色调上绘制清晰易读的字体颜色
      onPrimary: AppColor.dark,
      //在secondary上绘制清晰易读的颜色
      onSecondary: AppColor.primary,
      onSurface: AppColor.primary,
      onBackground: AppColor.info,
      onError: AppColor.danger,
    );
  }
}

ThemeData materialThemeColor() {
  return ThemeData(
    platform: TargetPlatform.iOS, //启动时候的平台模式，打包还是原来的模式

    // 用于去除水波纹
    splashColor: AppColor.transparent,
    highlightColor: AppColor.transparent,
    splashFactory: const NoSplashFactory(),

    primaryColor: AppColor.info,
    //用于materia应用程序或app内页面的背景色
    scaffoldBackgroundColor: AppColor.page,

    // * 全局主题
    colorScheme: ColorSchemeConfig.colorScheme(),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.info,
      labelStyle: const TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
      unselectedLabelColor: AppColor.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppColor.fontWeight,
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
        textStyle: MaterialStateProperty.all(TextStyle(color: AppColor.danger)),
        //未知
        backgroundColor: MaterialStateProperty.all(AppColor.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(AppColor.info),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(AppColor.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: AppColor.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),
    // * 进度指示器主题
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor.info,
    ),
    // * AppBar主题配置
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      elevation: 1,
    ),
    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primary,
      elevation: 0, //虚线阴影
      selectedItemColor: AppColor.info,
      unselectedItemColor: AppColor.unactive,
    ),
  );
}

ThemeData materialDarkTheme() {
  return ThemeData(
    // * 全局主题
    colorScheme: ColorSchemeConfig.colorScheme(mode: Brightness.dark),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      // indicator:,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.info,
      labelStyle: const TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
      unselectedLabelColor: AppColor.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
    ),
    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0, //虚线阴影
      selectedItemColor: AppColor.unactive,
      unselectedItemColor: AppColor.unactive,
    ),
  );
}
