import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/light.dart';
import 'package:flutter_sign_in/config/theme/font/font_global.dart';
import 'package:flutter_sign_in/utils/system/water_ripple.dart';

// 用于去除水波纹
// highlightColor: AppColorLight.transparent,
// splashColor: AppColorLight.transparent,
// splashFactory: const NoSplashFactory(),

final ThemeData materialLightTheme = _materialLightColor();

TextTheme _buildTextTheme(TextTheme base) => base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );

ThemeData _materialLightColor() {
  // 创建此配色方案的副本，并将给定字段替换为非空参数值
  final colorScheme = const ColorScheme.light().copyWith(
    // 日夜间模式
    brightness: Brightness.light,
    // 脚手架上面标题等主要颜色(包括文本按钮的颜色,旋转指示器)
    primary: AppColorLight.primary,
    // 黑暗主题的主色调
    primaryContainer: AppColorLight.primary,

    // 一种强调色，，有选定行时PaginatedDataTable标题的颜色（水波纹、浮动按钮）
    secondary: AppColorLight.secondary,
    secondaryContainer: AppColorLight.secondary,

    // 小部件的背景色 如:card appbar
    surface: AppColorLight.secondary,
    //可滚动内容后面的颜色
    background: AppColorLight.page,
    //用于输入验证错误的颜色，例如:InputDecoration.errorText
    error: AppColorLight.danger,

    // (按钮、AppBar) 在主色调上绘制清晰易读的字体颜色
    onPrimary: AppColorLight.unactive,
    // 在secondary上绘制清晰易读的颜色
    onSecondary: AppColorLight.un2active,
    onSurface: AppColorLight.un3active,
    onBackground: AppColorLight.unactive,
    onError: AppColorLight.danger,
  );

  final base = ThemeData(
    // applyElevationOverlayColor:,
    // cupertinoOverrideTheme:,
    // extensions:,

    // inputDecorationTheme:, // InputDecorator,TextField和TextFormField的默认 InputDecoration值基于此主题

    // materialTapTargetSize:,

    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      // TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
    }),
    platform: TargetPlatform.iOS, //需要适配的目标类型，启动时候的平台模式，打包还是原来的模式

    // scrollbarTheme:,

    splashFactory: const NoSplashFactory(), // 定义InkWall和InkResponse生成的动画的外观

    // visualDensity:,
    // useMaterial3:,

    // * 全局主题
    colorScheme: colorScheme,

    // colorSchemeSeed:,
    brightness: Brightness.light,

    // primarySwatch:,
    primaryColor: AppColorLight.primary, // App主要部分的背景色(ToolBar、Tabbar等)

    primaryColorLight: AppColorLight.secondary, // primaryColor的较亮版本

    primaryColorDark: AppColorLight.dark, // primaryColor的较暗版本

    // focusColor:,
    // hoverColor:,
    // shadowColor:,

    // MaterialType.canvas Material 的默认颜色
    canvasColor: AppColorLight.dark,

    // 作为Scaffold基础的Material默认颜色,典型Material应用或应用内页面的背景颜色
    scaffoldBackgroundColor: AppColorLight.page,

    // 底部导航的颜色
    bottomAppBarColor: AppColorLight.primary,

    // card颜色
    // cardColor:,

    // Dividers PopupMenuDividers的顔色, 也用于ListTiles中间和DataTables的每行中间
    // dividerColor:,

    highlightColor: AppColorLight.transparent, // 用于动画或指示菜单被选中的高亮颜色
    splashColor: AppColorLight.transparent, // 动画的颜色

    // selectedRowColor:, // 选中行时的高亮颜色
    // unselectedWidgetColor:, // 用于Widget处于非活动（但已启用）状态的颜色。例如，未选中的复选框。通常与accentColor形成对比

    // 用于Widget无效的颜色,包括任何状态。例如禁用复选框
    // disabledColor:,

    // 有选定行时PaginatedDataTable标题的颜色
    // secondaryHeaderColor:,

    // 与primaryColor对比的颜色(例如,用作进度条的剩余部分)
    backgroundColor: AppColorLight.page,

    // Dialog元素的背景色
    // dialogBackgroundColor:,

    // 选项选中的指示器颜色
    indicatorColor: AppColorLight.primary,

    // hintColor:,

    // 用于输人验证错误的颜色，例如在TextField中
    errorColor: AppColorLight.danger,

    toggleableActiveColor: AppColorLight.primary, // 用于突出显示切换Widget(如Switch、Radio和Checkbox)的活动状态的颜色

    // fontFamily:,
    // typography:,

    // textTheme:, // 与卡片和画布对比的文本颜色

    // primaryTextTheme:, // 与主色对比的文本主题

    // iconTheme:, // 图标主题,图标的默认配置

    // primaryIconTheme:, // 与主色对比的图标主题

    // * AppBar主题配置
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorLight.primary,
      elevation: 1,
    ),

    // bannerTheme:,
    // bottomAppBarTheme:,

    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorLight.primary,
      elevation: 0, //虚线阴影
      selectedItemColor: AppColorLight.secondary,
      unselectedItemColor: AppColorLight.unactive,
    ),

    // bottomSheetTheme:,
    // buttonBarTheme:,

    // 按钮等控件的默认配置，如RaisedButton和FlatButton
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),

    // cardTheme:,
    // checkboxTheme:,

    // chipTheme:,  // 用于渲染Chip的颜色和样式

    // dataTableTheme:,
    // dialogTheme:,
    // dividerTheme:,
    // drawerTheme:,

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

    // floatingActionButtonTheme:,
    // listTileTheme:,
    // navigationBarTheme:,
    // navigationRailTheme:,
    // outlinedButtonTheme:,
    // popupMenuTheme:,

    // * 进度指示器主题
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColorLight.secondary,
    ),

    // radioTheme:,
    // sliderTheme:,
    // snackBarTheme:,
    // switchTheme:,

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColorLight.secondary,
      labelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
      unselectedLabelColor: AppColorLight.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
    ),

    // * 文字按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: AppColorLight.unactive)),
        //未知
        backgroundColor: MaterialStateProperty.all(AppColorLight.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(AppColorLight.secondary),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(AppColorLight.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: AppColorLight.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),

    // textSelectionTheme:, // 文本字段中选中文本的颜色，例如TextField

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
