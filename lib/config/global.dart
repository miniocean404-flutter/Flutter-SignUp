import 'package:flutter/material.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/utils/shared_preferences.dart';

class Global {
  static void initCommon() {
    // 初始化路由
    Routers.defineRoutes();

    // 初始化持久化key,value存储工具
    SpHelper();
  }

  // 初始化屏幕自适应工具
  static initScreen(ctx) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(ctx).size.width,
        maxHeight: MediaQuery.of(ctx).size.height,
      ),
      designSize: const Size(768, 1024),
      context: ctx, // 传入context会更灵敏的根据屏幕变化而改变
      minTextAdapt: true, // 是否根据宽度/高度中的最小值适配文字
      orientation: Orientation.portrait, // 屏幕方向
      splitScreenMode: true, // 支持分屏尺寸
    );
  }
}
