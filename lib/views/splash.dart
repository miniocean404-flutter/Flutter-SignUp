// 启动页

import 'package:flutter/material.dart';
import 'package:flutter_sign_in/components/splash/click_jump_splash.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    initUrlScheme();
  }

  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  initUrlScheme() async {
    await initPlatformStateForStringUniLinks(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClickJumpSplash(
      goPagePath: CustomRoute().home,
      localImageUrl: Assets.splash,
    );
  }
}
