part of util.plugin;

/// 路由跳转 context schemeUrl
void schemeJump(BuildContext context, String schemeUrl) {
  final jumpUri = Uri.parse(schemeUrl.replaceFirst(
    'customscheme://',
    'http://path/', // 为了方便使用 Uri Api 直接获取参数
  ));

  switch (jumpUri.path) {
    case '/home':
      Routers().navigateTo(context, CustomRoute().home, params: jumpUri.queryParameters);
      break;
    default:
      break;
  }
}

late StreamSubscription sub;

/// 使用[String]链接实现
Future<void> initPlatformStateForStringUniLinks(BuildContext context) async {
  // if (kIsWeb) return;
  String? initialLink;
  // App未打开的状态在这个地方捕获scheme
  try {
    initialLink = await getInitialLink() ?? '';

    logger.i('初始化 Scheme 链接: $initialLink');

    //  跳转到指定页面
    // ignore: use_build_context_synchronously
    schemeJump(context, initialLink);
  } on PlatformException {
    initialLink = '失败的获取链接';
  } on FormatException {
    initialLink = '无法将初始链接解析为 Uri';
  }

  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    // App打开的状态监听scheme
    sub = linkStream.listen(
      (String? link) {
        logger.i('URL Scheme 指定页面 : $link');

        //  跳转到指定页面
        schemeJump(context, link!);
      },
      onError: (Object err) {
        logger.w('URL Scheme Error:$err');
      },
    );
  }
}
