import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/dark.dart';
import 'package:flutter_sign_in/config/theme/font/font_global.dart';
import 'package:flutter_sign_in/utils/system/water_ripple.dart';

final ThemeData materialDarkTheme = _materialDarkColor();

TextTheme _buildTextTheme(TextTheme base) => base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );

ThemeData _materialDarkColor() {
  final colorScheme = const ColorScheme.dark().copyWith(
    brightness: Brightness.light,
    primary: AppColorDark.primary,
    primaryContainer: AppColorDark.primary,
    secondary: AppColorDark.secondary,
    secondaryContainer: AppColorDark.secondary,
    surface: AppColorDark.secondary,
    background: AppColorDark.page,
    error: AppColorDark.danger,
    onPrimary: AppColorDark.unactive,
    onSecondary: AppColorDark.un2active,
    onSurface: AppColorDark.un3active,
    onBackground: AppColorDark.unactive,
    onError: AppColorDark.danger,
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
    // useMaterial3: true,

    // * 全局主题
    colorScheme: colorScheme,

    // colorSchemeSeed:,
    brightness: Brightness.light,

    // primarySwatch:,
    primaryColor: AppColorDark.primary,

    primaryColorLight: AppColorDark.secondary,

    primaryColorDark: AppColorDark.dark,

    // focusColor:,
    // hoverColor:,
    // shadowColor:,

    canvasColor: AppColorDark.dark,

    scaffoldBackgroundColor: AppColorDark.page,

    bottomAppBarColor: AppColorDark.primary,

    // cardColor:,

    // dividerColor:,

    highlightColor: AppColorDark.transparent,
    splashColor: AppColorDark.transparent,

    // selectedRowColor:,
    // unselectedWidgetColor:,

    // disabledColor:,

    // secondaryHeaderColor:,

    backgroundColor: AppColorDark.page,

    // dialogBackgroundColor:,

    indicatorColor: AppColorDark.primary,

    // hintColor:,

    errorColor: AppColorDark.danger,

    toggleableActiveColor: AppColorDark.primary,

    // fontFamily:,
    // typography:,

    // textTheme:,

    // primaryTextTheme:,

    // iconTheme:,

    // primaryIconTheme:,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.primary,
      elevation: 1,
    ),

    // bannerTheme:,
    // bottomAppBarTheme:,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.primary,
      elevation: 0,
      selectedItemColor: AppColorDark.secondary,
      unselectedItemColor: AppColorDark.unactive,
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
      color: AppColorDark.secondary,
    ),

    // radioTheme:,
    // sliderTheme:,
    // snackBarTheme:,
    // switchTheme:,

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
