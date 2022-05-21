import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign_in/config/theme/color.dart';

// 设置状态栏隐藏哪些，或者全部隐藏
void barWidgetShow({String? show}) {
  if (kIsWeb) return;

  if (show == null) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  } else if (show == 'top') {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  } else if (show == 'bottom') {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  } else {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }
}

// 状态栏和虚拟按键沉浸式
void barColor(String? color) {
  if (kIsWeb) return;

  if (color?.trim() == 'white') {
    SystemChrome.setSystemUIOverlayStyle(light);
  } else {
    SystemChrome.setSystemUIOverlayStyle(dark);
  }
}

// 白色沉浸式状态栏颜色  白色文字
SystemUiOverlayStyle light = SystemUiOverlayStyle(
  // * 虚拟按键
  systemNavigationBarDividerColor: AppColor.primary, //分割颜色
  systemNavigationBarColor: AppColor.primary, //背景色
  systemNavigationBarIconBrightness: Brightness.dark, //图标色(按钮、小白条)
  systemNavigationBarContrastEnforced: false,

  // * 状态栏
  // 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
  systemStatusBarContrastEnforced: false,
);

// 黑色沉浸式状态栏颜色 黑色文字
SystemUiOverlayStyle dark = SystemUiOverlayStyle(
  systemNavigationBarColor: AppColor.dark,
  systemNavigationBarDividerColor: AppColor.dark,
  systemNavigationBarIconBrightness: Brightness.light,

  /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
  systemStatusBarContrastEnforced: true,
);
