import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign_in/utils/plugin/device_info.dart';

// 设置状态栏隐藏哪些，或者全部隐藏
void barWidgetShow({String? show, SystemUiMode? type, List<SystemUiOverlay>? overlays}) {
  if (kIsWeb) return;

  // SystemUiMode.immersiveSticky 沉浸式-手势打开后自动隐藏(顶部和 底部,设置overlays无效)
  // SystemUiMode.immersive 沉浸式-手势打开后就不自动隐藏了(顶部和 底部,设置overlays无效)
  // SystemUiMode.leanBack 点击屏幕任何地方进行展示
  // SystemUiMode.edgeToEdge 展示顶部底部栏

  // overlays 知识用来设置SystemUiMode.manual 模式的参数,用来显示哪些进行展示
  if (show == null) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return;
  }

  if (show == 'all') {
    final info = DeviceInfo.info;

    if (Platform.isAndroid && (info['version.sdkInt'] < 29 || int.parse(info['version.release']) < 10)) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // 安卓 10 以上支持
    }
    return;
  }

  if (show == 'top') {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return;
  }

  if (show == 'bottom') {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return;
  }

  if (show == 'custom') {
    SystemChrome.setEnabledSystemUIMode(type!, overlays: overlays);
  }
}

// 状态栏和虚拟按键沉浸式
void barColor(bool isDarkMode) {
  if (kIsWeb) return;

  if (!isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(light);
  } else {
    SystemChrome.setSystemUIOverlayStyle(dark);
  }
}

// 白色沉浸式状态栏颜色  白色文字
SystemUiOverlayStyle light = const SystemUiOverlayStyle(
  // 虚拟按键
  // 分割颜色
  systemNavigationBarDividerColor: Colors.transparent,
  // 背景色,设置为透明防止翻页时候导致的变暗而有细缝,设置后systemNavigationBarDividerColor也失效
  systemNavigationBarColor: Colors.transparent,
  // 图标色(按钮、小白条)
  systemNavigationBarIconBrightness: Brightness.dark,
  // true为强制设置白色背景条确保与图标和应用程序的背景形成对比
  // 并且虚拟按键也有强制添加导致上划有白色细线
  systemNavigationBarContrastEnforced: false,

  // 状态栏
  // 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
  // true为强制设置白色背景条确保与图标和应用程序的背景形成对比
  // 安卓10 sdk 29 可用
  systemStatusBarContrastEnforced: false,
);

SystemUiOverlayStyle dark = const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarContrastEnforced: false,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
  systemStatusBarContrastEnforced: false,
);
