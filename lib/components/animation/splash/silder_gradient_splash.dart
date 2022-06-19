import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SilderGradientSplash extends StatefulWidget {
  final Color? bgColor;
  final Color? silderColor;
  final String? appName;
  const SilderGradientSplash({Key? key, this.bgColor, this.silderColor, this.appName}) : super(key: key);

  @override
  State<SilderGradientSplash> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SilderGradientSplash> {
  late final Color bgColor = widget.bgColor ?? Colors.black;
  late final Color silderColor = widget.bgColor ?? Colors.white;
  late final String appName = widget.appName ?? 'APP 名字';

  bool bgWidthEqualScreen = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        bgWidthEqualScreen = !bgWidthEqualScreen;
      });
    });

    Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(SlideTransitionAnimation(const SecondPage()));
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
      backgroundColor: silderColor,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: bgWidthEqualScreen ? width : 0,
            height: height,
            color: bgColor,
          ),
          Center(
            child: Text(
              appName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: silderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
