import 'package:flutter/material.dart';

// 配合 Navigator.of(context).push 使用
// 例如: Navigator.of(context).push(showHero(ViewImage(url: Assets.stateIconError)));

// 底部弹出窗
Route bottomPopRouter(Widget widget, {opaque = false}) {
  return PageRouteBuilder(
    opaque: opaque,
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero; //  Offset.zero === Offset(0.0, 0.0)
      var curve = Curves.ease;

      // Tween 用于大小
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      // 平移动画，
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// AlertBox, 只显示widget，背景透明
Route showDialogRouter(Widget widget, {Color? bgColor}) {
  return PageRouteBuilder(
    opaque: false,
    barrierColor: bgColor ?? Colors.black.withOpacity(0.7),
    transitionDuration: const Duration(milliseconds: 240),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> __, Widget child) {
      // 渐隐渐显动画
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.1, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}

// Hero 动画使用，在当前页面写下 hero 并标记标签，路由跳转的第二个页面也要有相同的 tag
Route showHero(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    // 阴影颜色
    barrierColor: Colors.black.withOpacity(0.7),
    // pageBuilder 表示跳转的页面。
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => widget,
    // transitionsBuilder 表示页面的动画效果，默认值代码：
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> __, Widget child) {
      // 透明曲线, Curves 用于颜色等曲线 动画区间 Interval
      const opacityCurve = Interval(0.0, 1, curve: Curves.fastOutSlowIn);

      // 可无 AnimatedBuilder 只是展示如何使用
      return AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: opacityCurve.transform(animation.value),
            child: child,
          );
        },
      );
    },
  );
}
