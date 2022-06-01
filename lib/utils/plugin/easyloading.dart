// https://github.com/nslogx/flutter_easyloading/blob/master/README-zh_CN.md

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void initCustomEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom

    // 常规设置
    ..displayDuration = const Duration(milliseconds: 2000) // 展示时间
    ..animationDuration = const Duration(milliseconds: 200) // 动画时间
    ..toastPosition = EasyLoadingToastPosition.center // toast 位置
    ..animationStyle = EasyLoadingAnimationStyle.scale // toast 打开时动画类型
    ..fontSize = 16.sp // 图标文本大小
    ..textColor = Colors.white // 文本颜色
    ..textAlign = TextAlign.center // 文本的对齐方式
    ..radius = 10.0 // 边框圆角
    // 内边距
    ..contentPadding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 20.0,
    )

    // 遮罩
    ..maskType = EasyLoadingMaskType.custom // loading的遮罩类型
    ..maskColor = Colors.black.withOpacity(0.5) // 遮罩颜色

    // loading 框设置
    ..indicatorType = EasyLoadingIndicatorType.ring // loading样式
    ..backgroundColor = Colors.black // 背景颜色
    ..indicatorSize = 45.0 // 图标大小
    ..indicatorColor = Colors.white // 图标颜色
    ..lineWidth = 1.0 // loading 框的宽度

    // 进度条
    ..progressWidth = 1.0 // 进度条指示器的宽度
    ..progressColor = Colors.black // 进度条指示器的颜色

    // 操作设置
    ..userInteractions = true // 当loading展示的时候，是否允许用户操作.
    ..dismissOnTap = false // 是否在用户点击时关闭

    // 指示器样式设置
    //  ..indicatorWidget // 指示器自定义组件
    //  ..successWidget // 展示成功状态的自定义组件
    //  ..errorWidget // 展示失败状态的自定义组件
    //  ..infoWidget // 展示信息状态的自定义组件
    //  ..customAnimation = CustomAnimation();
    ..customAnimation = null // toast 打开时自定义动画
    ..textStyle = null; // 文本样式
}
