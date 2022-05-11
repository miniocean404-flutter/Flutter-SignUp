// 启动页
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:flutter_sign_in/router/routers.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  int step = 3;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode();
    animationExec();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // 销毁动画
    _timer.cancel();
    super.dispose();
  }

  void animationExec() {
    //创建动画控制器
    // 1.当创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画（动画的 UI不在当前屏幕时）消耗不必要的资源。
    // 2.通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值。如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: step * 1000),
    );

    final _animation = Tween(begin: 1.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.forward) startTiming();

      // 添加动画的监听，当动画完成后的状态是completed完成状态，则执行这边的代码，跳转到登录页
      if (status == AnimationStatus.completed) startJump();
    });

    // 开始执行动画
    _controller.forward();
  }

  void startTiming() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_timer) {
      setState(() => step--);
    });
  }

  void startJump() {
    Routers.navigateTo(context, Routers.home, clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: Image.asset(
              Assets.splash,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: OutlinedButton(
              child: Text('${step}s跳过'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () => {startJump()},
            ),
          )
        ],
      ),
    );
  }
}
