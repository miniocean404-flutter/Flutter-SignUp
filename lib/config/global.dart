import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/theme/is_dark_mode.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:flutter_sign_in/utils/plugin/device_info.dart';
import 'package:flutter_sign_in/utils/plugin/local_notifications.dart';
import 'package:flutter_sign_in/utils/plugin/shared_preferences.dart';
import 'package:flutter_sign_in/utils/system/immerse.dart';

class Global {
  static Future initCommon() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 当输入和显示频率不同导致的性能下降处理
    GestureBinding.instance.resamplingEnabled = true;

    // 优化图片缓存内存
    // 在图片加载解码完成之前，无法知道到底将要消耗多少内存，容易产生大量的IO操作，导致内存峰值过高
    // 图片缓存个数 100
    PaintingBinding.instance.imageCache.maximumSize = 100;
    // 图片缓存大小 50m
    PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20;

    // 初始化路由
    Routers.defineRoutes();

    barWidgetShow();

    // 本地通知
    await LocalNotifications.init();

    await DeviceInfo().init();

    // 初始化持久化key,value存储工具
    await SpHelper.init();
  }

  // 根据context动态初始化
  static dynamicInit(ctx) {
    // 初始化屏幕自适应工具,配合 MediaQuery 限制文字缩放
    // MediaQuery.of(context) 的使用必须在 WidgetsApp or MaterialApp 里来提供数据。
    ScreenUtil.init(
      ctx, // 传入context会更灵敏的根据屏幕变化而改变
      orientation: Orientation.portrait, // 屏幕方向
      designSize: const Size(768, 1024),
      minTextAdapt: true, // 是否根据宽度/高度中的最小值适配文字
      splitScreenMode: true, // 支持分屏尺寸
      deviceSize: Size(window.physicalSize.width, window.physicalSize.height),
    );

    // 初始化沉浸式状态栏
    barColor(isDarkMode(ctx));
  }
}
