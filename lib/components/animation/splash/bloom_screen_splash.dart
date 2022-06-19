import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloomScreenSplash extends StatefulWidget {
  final String? appName;
  final Color? startColor;
  final Color? finalColor;

  const BloomScreenSplash({Key? key, this.appName, this.startColor, this.finalColor}) : super(key: key);

  @override
  State<BloomScreenSplash> createState() => _SecondPageState();
}

class _SecondPageState extends State<BloomScreenSplash> {
  late final String appName = widget.appName ?? '你的 APP 名字';
  late final Color startColor = widget.startColor ?? Colors.black;
  late final Color finalColor = widget.finalColor ?? Colors.white;

  bool isShowFirstScreen = false; // 第一屏
  bool isShowFinalScreen = false; // 最后一屏
  bool finalIsShowText = false; // 最后一屏是否展示文字
  bool screenToggleColor = true; // 每次屏幕切换时的颜色

  late final TextStyle initialStyle;
  late final TextStyle finalStyle;

  @override
  void initState() {
    initialStyle = TextStyle(
      fontSize: 30,
      color: startColor,
      fontWeight: FontWeight.w600,
      wordSpacing: 2,
    );

    finalStyle = TextStyle(
      fontSize: 30,
      color: finalColor,
      fontWeight: FontWeight.w600,
      wordSpacing: 2,
    );

    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        finalIsShowText = true;
        isShowFirstScreen = true;
        screenToggleColor = !screenToggleColor;
      });
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        finalIsShowText = false;
        isShowFinalScreen = true;
        screenToggleColor = !screenToggleColor;
      });
    });

    Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
        ThisIsFadeRoute(
          route: const ThirdPage(),
        ),
      );
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
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isShowFirstScreen ? height : 0,
              width: isShowFirstScreen ? width : 0,
              decoration: BoxDecoration(
                color: startColor,
                borderRadius: BorderRadius.circular(isShowFirstScreen ? 0 : 99),
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2200),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isShowFinalScreen ? height : 0,
              width: isShowFinalScreen ? width : 0,
              decoration: BoxDecoration(
                color: finalColor,
                borderRadius: BorderRadius.circular(isShowFinalScreen ? 0 : 99),
              ),
            ),
          ),
          Center(
            child: finalIsShowText
                ? AnimatedDefaultTextStyle(
                    style: screenToggleColor ? initialStyle : finalStyle,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Text(appName),
                  )
                : const SizedBox(),
          ),
        ],
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
      appBar:
          AppBar(title: const Text('HOME PAGE'), centerTitle: true, backgroundColor: Colors.black, systemOverlayStyle: SystemUiOverlayStyle.light),
      body: const Center(
        child: Text(
          "APP HOME PAGE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
