// import these Packages in pubspec.yaml file.
// dependencies:
//
//   animated_text_kit:

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextJumpSplash extends StatefulWidget {
  final Color? bgColor;
  final Color? ballColor;
  final String? title;

  const TextJumpSplash({Key? key, this.bgColor, this.ballColor, this.title}) : super(key: key);

  @override
  State<TextJumpSplash> createState() => _TextJumpSplashState();
}

class _TextJumpSplashState extends State<TextJumpSplash> {
  late final Color? bgColor = widget.bgColor ?? Colors.black;
  late final Color? ballColor = widget.ballColor ?? Colors.white;
  late final String title = widget.title ?? '游泳课签到';

  bool boxInitHeight = false; // false 为 20 true 为屏幕一半
  bool smallBallColor = false; // 球的颜色
  bool boxIsExpand = false; // 由 球 展开为盒子的条件
  bool boxAnimationIsFinish = false; // 动画是否结束
  bool textContainerIsShow = false; // 文字是否展示

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        boxInitHeight = true;
        smallBallColor = true;
      });
    });

    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        boxIsExpand = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        textContainerIsShow = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        boxAnimationIsFinish = true;
      });
    });
    Timer(const Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: const ThirdPage(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          children: [
            // 顶着盒子向下的条形物，可设置颜色查看
            AnimatedContainer(
              duration: Duration(milliseconds: boxAnimationIsFinish ? 900 : 2500),
              curve: boxAnimationIsFinish ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: boxAnimationIsFinish
                  ? 0
                  : boxInitHeight
                      ? height / 2
                      : 20,
              width: 20,
            ),

            // 控制盒子 从 球 变为 盒子 大小变化的动画
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                color: smallBallColor ? ballColor : bgColor,
                // 控制盒子动画结束后 盒子 展开屏幕时的圆角
                borderRadius: boxAnimationIsFinish ? BorderRadius.circular(30) : BorderRadius.circular(30),
              ),
              // 控制持续时间
              duration: Duration(
                seconds: boxAnimationIsFinish
                    ? 1
                    : boxIsExpand
                        ? 2
                        : 0,
              ),
              // 控制盒子动画结束后 盒子 展开屏幕时的背景高度
              height: boxAnimationIsFinish
                  ? height
                  : boxIsExpand
                      ? 80
                      : 20,
              // 控制盒子动画结束后 盒子 展开屏幕时的背景宽度
              width: boxAnimationIsFinish
                  ? width
                  : boxIsExpand
                      ? 200
                      : 20,

              child: Center(
                child: textContainerIsShow
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            title,
                            duration: const Duration(milliseconds: 1700),
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget route;

  ThisIsFadeRoute({this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page ?? Container(),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        centerTitle: true,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
