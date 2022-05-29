import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/app_color.dart';
import 'package:flutter_sign_in/config/theme/font/font_global.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

// 用于去除水波纹
// highlightColor: AppColor().light.transparent,
// splashColor: AppColor().light.transparent,
// splashFactory: const NoSplashFactory(),

final ThemeData materialLightTheme = _materialLightColor();

TextTheme _buildTextTheme(TextTheme base) => base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );

ThemeData _materialLightColor() {
  // Primary(原色)色用于整个 UI 中的关键组件，例如 FAB、突出按钮和活动状态。
  // Secondary(二次)色用于UI中不太突出的组件，例如滤镜芯片，同时扩大了颜色表达的机会。
  // Tertiary(三次)色用于对比强调色，可用于平衡原色和二次色或增加对元素的关注，例如输入字段。第三色由制造商自行决定使用，旨在支持产品中更广泛的颜色表达
  // “on”颜色，用于在匹配颜色之上绘制内容。例如，如果某物使用 primary作为背景颜色，onPrimary将用于在其上绘制文本和图标。出于这个原因，“打开”颜色应与其匹配颜色具有至少
  final colorScheme = const ColorScheme.light().copyWith(
    // 日夜间模式
    brightness: Brightness.light,

    // 脚手架上面标题等主要颜色(包括文本按钮的颜色,旋转指示器)，在您的应用程序的屏幕和组件中最常显示的颜色
    primary: AppColor().light.primary,

    // (按钮、AppBar) 在主色调上绘制其他部件的颜色
    onPrimary: AppColor().light.unactive,

    // 一种颜色，用于需要比原色少一些强调的元素
    primaryContainer: AppColor().light.primary,

    // 在primaryContainer色调上绘制其他部件的颜色
    //  onPrimaryContainer:,

    // 用于 UI 中不太显眼的组件（例如滤镜芯片）的强调色，有选定行时PaginatedDataTable标题的颜色（水波纹、浮动按钮）
    secondary: AppColor().light.secondary,

    // 在secondary上绘制其他部件的颜色
    onSecondary: AppColor().light.un2active,

    // 比secondary弱一些的色调
    secondaryContainer: AppColor().light.secondary,

    // secondaryContainer上绘制其他部件的颜色
    // onSecondaryContainer:,

    // 三级色调一种用作对比强调色的颜色，可以平衡原色和次要颜色，或增加对元素的关注，例如输入字段
    // tertiary:,

    // tertiary上绘制其他部件的颜色
    //  onTertiary:,

    // 用于需要比第三级更少强调的元素。
    //  tertiaryContainer:,

    // tertiaryContainer上绘制其他部件的颜色
    //  onTertiaryContainer:,

    // 用于输入验证错误的颜色，例如:InputDecoration.errorText
    error: AppColor().light.danger,
    onError: AppColor().light.danger,

    // 一种用于错误元素的颜色，它需要的重点少于错误
    //  errorContainer:,
    //  onErrorContainer:,

    //可滚动内容后面的颜色
    background: AppColor().light.page,
    onBackground: AppColor().light.unactive,

    // 小部件的背景色 如:card appbar
    surface: AppColor().light.secondary,
    onSurface: AppColor().light.un3active,

    // 用于对比surface的颜色变量
    //  surfaceVariant:,
    //  onSurfaceVariant:,

    // matrial3开启时 可创建边界和强调,outline 这种按钮的边框颜色
    outline: AppColor().light.border,

    // 绘制高架组件的阴影的颜色
    //  shadow:,

    // 用于显示与周围 UI 中看到的相反的内容，例如在 SnackBar 中以引起对警报的关注点。
    //  inverseSurface:,
    //  onInverseSurface:,

    // 用于在 inverseSurface 背景上显示高亮颜色，例如 SnackBar 中的按钮文本
    //  inversePrimary:,

    // 用作表面颜色上的叠加层，以指示组件的高度
    //  surfaceTint:,
  );

  final base = ThemeData(
    // applyElevationOverlayColor:,
    // cupertinoOverrideTheme:,
    // 对于主题颜色的扩展，继承重写别的主题配置，是个可迭代的Map
    // extensions:,

    // InputDecorator,TextField和TextFormField的默认 InputDecoration值基于此主题
    // inputDecorationTheme:,

    // 配置某些 Material widget 的命中测试大小,在移动平台上为MaterialTapTargetSize.padded，在桌面平台上为MaterialTapTargetSize.shrinkWrap
    // materialTapTargetSize:,

    // 每个TargetPlatform的默认MaterialPageRoute过渡。
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.iOS: ,
    // }),

    //需要适配的目标类型，启动时候的平台模式，打包还是原来的模式
    platform: TargetPlatform.iOS,

    // 用于自定义Scrollbar的颜色、粗细和形状的主题。
    // scrollbarTheme:,

    // 定义InkWall和InkResponse生成的动画的外观
    splashFactory: const NoSplashFactory(),

    // 定义用户界面组件的 “紧凑性” 它不影响文本大小、图标大小或填充值。
    // 例如，对于按钮，它会影响按钮子元素周围的间距。对于列表，它会影响列表中条目基线之间的距离。对于clip，它只影响垂直尺寸，而不影响水平尺寸。
    // visualDensity:,

    // 是否使用Material3主题
    useMaterial3: true,

    // 全局主题,一组十二种颜色，可用于配置大多数组件的颜色属性。
    // 此属性的添加比主题的高度特定颜色集（如cardColor、buttonColor、canvasColor等）晚得多。新组件可以专门根据colorScheme定义。
    // 现有组件将逐渐迁移到它，在没有显着向后兼容性中断的情况下尽可能地迁移。
    colorScheme: colorScheme,

    // colorSchemeSeed:,

    brightness: Brightness.light,

    // primarySwatch:,

    // App主要部分的背景色(ToolBar、Tabbar等)
    primaryColor: AppColor().light.primary,

    // primaryColor的较亮版本
    primaryColorLight: AppColor().light.secondary,

    // primaryColor的较暗版本
    primaryColorDark: AppColor().light.black,

    // 使用的焦点颜色表示组件具有输入焦点
    // focusColor:,

    // 用于指示指针何时悬停在组件上的悬停颜色
    // hoverColor:,

    // 用于绘制高程阴影的颜色
    // 默认为完全不透明的黑色。
    // shadowColor:,

    // MaterialType.canvas Material 的默认颜色
    canvasColor: AppColor().light.black,

    // 作为Scaffold基础的Material默认颜色,典型Material应用或应用内页面的背景颜色
    scaffoldBackgroundColor: AppColor().light.page,

    // 底部导航的颜色
    bottomAppBarColor: AppColor().light.primary,

    // card颜色
    // cardColor:,

    // Dividers PopupMenuDividers的顔色, 也用于ListTiles中间和DataTables的每行中间
    // dividerColor:,

    // 用于动画或指示菜单被选中的高亮颜色
    highlightColor: AppColor().light.transparent,

    // 动画的颜色
    splashColor: AppColor().light.transparent,

    // 选中行时的高亮颜色
    // selectedRowColor:,

    // 用于Widget处于非活动（但已启用）状态的颜色。例如，未选中的复选框。通常与accentColor形成对比
    // unselectedWidgetColor:,

    // 用于Widget无效的颜色,包括任何状态。例如禁用复选框
    // disabledColor:,

    // 有选定行时PaginatedDataTable标题的颜色
    // secondaryHeaderColor:,

    // 与primaryColor对比的颜色(例如,用作进度条的剩余部分)
    backgroundColor: AppColor().light.page,

    // Dialog元素的背景色
    // dialogBackgroundColor:,

    // 选项选中的指示器颜色
    indicatorColor: AppColor().light.primary,

    // 用于提示文本或占位符文本的颜色，例如在 TextField 字段中。
    // hintColor:,

    // 用于输人验证错误的颜色，例如在TextField中
    errorColor: AppColor().light.danger,

    // 用于突出显示切换Widget(如Switch、Radio和Checkbox)的活动状态的颜色
    toggleableActiveColor: AppColor().light.primary,

    fontFamily: 'GoogleSans',

    // 活版印刷
    // typography:,

    // 与卡片和画布对比的文本颜色
    // textTheme:,

    // 与主色对比的文本主题
    // primaryTextTheme:,

    // 图标主题,图标的默认配置
    // iconTheme:,

    // 与主色对比的图标主题
    // primaryIconTheme:,

    // AppBar主题配置
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor().light.primary,
      elevation: 1,
    ),

    // 用于自定义 MaterialBanner 的颜色和文本样式的主题
    // bannerTheme:,

    // 用于自定义 BottomAppBar 的形状、高度和颜色的主题。
    // bottomAppBarTheme:,

    // 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor().light.primary,
      elevation: 0, //虚线阴影
      selectedItemColor: AppColor().light.secondary,
      unselectedItemColor: AppColor().light.unactive,
    ),

    // 用于自定义底页颜色、高度和形状的主题。
    // bottomSheetTheme:,

    // 用于自定义 ButtonBar 小部件的外观和布局的主题。
    // buttonBarTheme:,

    // 按钮等控件的默认配置，如RaisedButton和FlatButton
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),

    // 用于渲染卡片的颜色和样式,这是从 CardTheme.of 返回的值
    // cardTheme:,

    // 用于自定义 Checkbox 小部件的外观和布局的主题
    // checkboxTheme:,

    // 用于渲染Chip的颜色和样式
    // chipTheme:,

    // 用于自定义 DataTable 小部件的外观和布局的主题。
    // dataTableTheme:,

    // 用于自定义对话框形状的主题。
    // dialogTheme:,

    // 用于自定义 Dividers、VerticalDividers 等的颜色、粗细和缩进的主题。
    // dividerTheme:,

    // 用于自定义 Drawer 小部件的外观和布局的主题
    // drawerTheme:,

    // 用于自定义 ElevatedButtons 外观和内部布局的主题
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

    // 用于自定义 FloatingActionButton 的形状、高度和颜色的主题
    // floatingActionButtonTheme:,

    // 用于自定义 ListTile 小部件外观的主题。
    // listTileTheme:,

    //  navigationBar 的形状、高度和颜色的主题
    // navigationBarTheme:,

    // navigationRail 的形状、高度和颜色的主题
    // navigationRailTheme:,

    // outlinedButton 的形状、高度和颜色的主题
    // outlinedButtonTheme:,

    // popupMenu 的形状、高度和颜色的主题
    // popupMenuTheme:,

    // 进度指示器主题
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor().light.secondary,
    ),

    // radio主题
    // radioTheme:,

    // slider主题
    // sliderTheme:,

    // snackBar主题
    // snackBarTheme:,

    // switch主题
    // switchTheme:,

    // 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor().light.secondary,
      labelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
      unselectedLabelColor: AppColor().light.unactive,
      labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: const TextStyle(
        fontWeight: AppFont.fontWeight,
      ),
    ),

    // 文字按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: AppColor().light.unactive)),
        //未知
        backgroundColor: MaterialStateProperty.all(AppColor().light.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(AppColor().light.secondary),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(AppColor().light.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: AppColor().light.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),

    // 文本字段中选中文本的颜色，例如TextField
    // textSelectionTheme:,

    // timePicker 主题
    // timePickerTheme:,

    // 切换按钮主题
    // toggleButtonsTheme:,

    // tooltip主题
    // tooltipTheme:,

    // expansionTile主题
    // expansionTileTheme:,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
