import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign_in/config/assets.dart';

class ShowLogoSplash extends StatefulWidget {
  final Color? bgColor;
  final Color? textAndLogoColor;
  final String? appName;
  final String? localImageUrl;
  const ShowLogoSplash({Key? key, this.bgColor, this.appName, this.textAndLogoColor, this.localImageUrl}) : super(key: key);

  @override
  State<ShowLogoSplash> createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<ShowLogoSplash> with TickerProviderStateMixin {
  late final Color? bgColor = widget.bgColor ?? Colors.deepPurple;
  late final Color textAndLogoColor = widget.textAndLogoColor ?? Colors.white;
  late final String appName = widget.appName ?? '你的 APP 名字';
  late final String localImageUrl = widget.localImageUrl ?? Assets.logo;

  double _fontSize = 2; // 盒子大小相对于屏幕高度的比例
  double _containerSize = 1.5; // 盒子大小相对于屏幕的比例
  double _textOpacity = 0.0; // 是否展示文字
  double _containerOpacity = 0.0; // 是否展示容器

  late AnimationController _controller;
  late Animation<double> textBigToSmallAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // addListener 监听动画每一帧 并且 setState 及时 更新 textBigToSmallAnimation 值，使文字变化大小
    textBigToSmallAnimation = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.12;
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(const SecondPage()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              // 控制文字位置
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: height / _fontSize,
              ),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                // 是否展示文字
                opacity: _textOpacity,
                child: Text(
                  appName,
                  style: TextStyle(
                    color: textAndLogoColor,
                    fontWeight: FontWeight.bold,
                    // 控制文字大小
                    fontSize: textBigToSmallAnimation.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            // 控制盒子是否展示
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,

              // 控制盒子 逐渐变小 变化
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: width / _containerSize,
                width: width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: textAndLogoColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(localImageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'YOUR APP\'S NAME',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
