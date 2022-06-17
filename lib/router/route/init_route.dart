// on XXX 类 则表示该mixin只能在那个类的子类使用，mixin中可以调用那个类定义的方法、属性
// 可以写抽象方法，让 with mixin 的 类重写

part of fluro_routers;

mixin InitRoute {
  final String splash = "/";
  final String home = "/home";
  final String webview = "/webview";

  final splashHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Splash();
  });

  final homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Home();
  });

  final webviewHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return BusinWebView(
      url: params['url'][0] ?? '',
    );
  });

  // 404页面
  final page404Handler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    logger.w('没有匹配的路由!');

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('404页面'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('404', style: Theme.of(context!).textTheme.headline4),
              CupertinoButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  });
}
