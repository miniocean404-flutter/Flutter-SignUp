import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

// 帮助 logo 从 方形盒子展开为全屏动画
class ScaleLogoSplash extends StatefulWidget {
  final Color? color;
  final Widget child;
  final BorderRadiusGeometry? radius;
  final Function? animationFinish;
  final Widget? goPageWidge;
  final String? goPagePath;

  const ScaleLogoSplash({
    Key? key,
    this.color,
    this.radius,
    this.animationFinish,
    this.goPageWidge,
    this.goPagePath,
    required this.child,
  }) : super(key: key);

  @override
  State<ScaleLogoSplash> createState() => _ScaleLogoSplashState();
}

class _ScaleLogoSplashState extends State<ScaleLogoSplash> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late Color color = widget.color ?? '#000000'.toColor();
  late BorderRadiusGeometry radius = widget.radius ?? BorderRadius.circular(20);
  late final Function? animationFinish = widget.animationFinish;
  late final Widget? goPageWidge = widget.goPageWidge;
  late final String? goPagePath = widget.goPagePath;

  double _opacity = 0; // 动画结束时透明
  bool is200Box = true; // 是否为 200 大小的盒子

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final Function? cb = animationFinish;
          if (cb != null) cb();

          final String? path = goPagePath;
          if (path != null) {
            Routers().navigateTo(
              path,
              clearStack: true,
              transition: TransitionType.custom,
              transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          }

          Widget? page = goPageWidge;
          if (page != null) {
            Navigator.of(context).pushReplacement(CustomFadeRoute(
              route: page,
            ));
          }

          Timer(const Duration(milliseconds: 300), () {
            scaleController.reset();
          });
        }
      });

    // animate 使值跟随 scaleController 时间而控制
    scaleAnimation = Tween<double>(begin: 1, end: 12).animate(scaleController);

    // 控制什么时候变为透明及变为200大小的盒子
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        is200Box = false;
      });
    });

    // 两秒后 执行 缩放动画
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 控制盒子透明度
        child: AnimatedOpacity(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 6), // 控制透明度动画持续时间
          opacity: _opacity,

          // 展示一个 由 50 变为 200 的盒子
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 2), // 控制盒子大小动画持续时间
            height: is200Box ? 50 : 200,
            width: is200Box ? 50 : 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(.2),
                  blurRadius: 100,
                  spreadRadius: 10,
                ),
              ],
            ),

            child: Stack(
              children: [
                AnimatedBuilder(
                  // 控制盒子由 0 变为 12 (从 200 变全屏)
                  animation: scaleAnimation,
                  builder: (ctx, child) {
                    return Transform.scale(
                      scale: scaleAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: color,
                          borderRadius: radius,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: radius,
                    color: color,
                  ),
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 路由动画
class CustomFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget route;

  CustomFadeRoute({this.page, required this.route})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page ?? Container();
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: route,
            );
          },
        );
}
