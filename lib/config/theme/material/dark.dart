import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/app_color.dart';
import 'package:flutter_sign_in/config/theme/font/font_global.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

final ThemeData materialDarkTheme = _materialDarkColor();

TextTheme _buildTextTheme(TextTheme base) => base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );

ThemeData _materialDarkColor() {
  final colorScheme = const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    primary: AppColor().dark.primary,
    primaryContainer: AppColor().dark.primary,
    secondary: AppColor().dark.secondary,
    secondaryContainer: AppColor().dark.secondary,
    surface: AppColor().dark.secondary,
    background: AppColor().dark.page,
    error: AppColor().dark.danger,
    onPrimary: AppColor().dark.unactive,
    onSecondary: AppColor().dark.un2active,
    onSurface: AppColor().dark.un3active,
    onBackground: AppColor().dark.unactive,
    onError: AppColor().dark.danger,
    outline: AppColor().dark.border,
  );

  final base = ThemeData(
    // applyElevationOverlayColor:,
    // cupertinoOverrideTheme:,
    // extensions:,
    // inputDecorationTheme:,
    // materialTapTargetSize:,

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        // TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
      },
    ),
    platform: TargetPlatform.iOS,

    // scrollbarTheme:,

    splashFactory: const NoSplashFactory(),

    // visualDensity:,

    useMaterial3: true,

    // * 全局主题
    colorScheme: colorScheme,

    // colorSchemeSeed:,
    brightness: Brightness.dark,

    // primarySwatch:,
    primaryColor: AppColor().dark.primary,

    primaryColorLight: AppColor().dark.secondary,

    primaryColorDark: AppColor().dark.black,

    // focusColor:,
    // hoverColor:,

    // shadowColor:,

    canvasColor: AppColor().dark.black,

    scaffoldBackgroundColor: AppColor().dark.page,

    bottomAppBarColor: AppColor().dark.primary,

    // cardColor:,

    // dividerColor:,

    highlightColor: AppColor().dark.transparent,
    splashColor: AppColor().dark.transparent,

    // selectedRowColor:,
    // unselectedWidgetColor:,

    // disabledColor:,

    // secondaryHeaderColor:,

    backgroundColor: AppColor().dark.page,

    // dialogBackgroundColor:,

    indicatorColor: AppColor().dark.primary,

    // hintColor:,

    errorColor: AppColor().dark.danger,

    toggleableActiveColor: AppColor().dark.primary,

    fontFamily: 'GoogleSans',
    // typography:,

    // textTheme:,

    // primaryTextTheme:,

    // iconTheme:,

    // primaryIconTheme:,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor().dark.primary,
      elevation: 1,
    ),

    // bannerTheme:,
    // bottomAppBarTheme:,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor().dark.primary,
      elevation: 0,
      selectedItemColor: AppColor().dark.secondary,
      unselectedItemColor: AppColor().dark.unactive,
    ),

    // bottomSheetTheme:,
    // buttonBarTheme:,

    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),

    // cardTheme:,
    // checkboxTheme:,

    // chipTheme:,

    // dataTableTheme:,
    // dialogTheme:,
    // dividerTheme:,
    // drawerTheme:,

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

    // floatingActionButtonTheme:,
    // listTileTheme:,
    // navigationBarTheme:,
    // navigationRailTheme:,
    // outlinedButtonTheme:,
    // popupMenuTheme:,

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor().dark.secondary,
    ),

    // radioTheme:,
    // sliderTheme:,
    // snackBarTheme:,
    // switchTheme:,

    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor().dark.secondary,
      labelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
      unselectedLabelColor: AppColor().dark.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: AppColor().dark.unactive)),
        //未知
        backgroundColor: MaterialStateProperty.all(AppColor().dark.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(AppColor().dark.secondary),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(AppColor().dark.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: AppColor().dark.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),

    // textSelectionTheme:,

    // timePickerTheme:,
    // toggleButtonsTheme:,
    // tooltipTheme:,
    // expansionTileTheme:,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
