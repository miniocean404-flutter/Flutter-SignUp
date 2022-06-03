part of fluro_routers;

typedef FluroRouterNavigateTo = Future<dynamic> Function(
  String path, {
  Map<String, dynamic>? params,
  bool clearStack, // 是否清理页面栈
  bool replace,
  TransitionType transition,
  Duration? transitionDuration,
  RouteSettings? routeSettings, // 路由要进入的页面名及参数
  RouteTransitionsBuilder? transitionBuilder, // 要执行的动画效果
});

typedef FluroRouterGenerator = Route<dynamic>? Function(RouteSettings settings);

class InitFluroRouter with RouteAnimationDialog {
  late final FluroRouter router;

  static final InitFluroRouter _instance = InitFluroRouter._in();
  factory InitFluroRouter() => _instance;

  InitFluroRouter._in() {
    router = FluroRouter();
  }

  BuildContext? initGlobalKeyContext;

  Route<dynamic>? generator(RouteSettings settings) {
    // 处理 路由需要全局 context 问题, 及不能及时获取 currentState 而获取不到 context
    initGlobalKeyContext ??= Global.navigatorStateKey.currentContext;

    return router.generator(settings);
  }

  Future<void> navigateTo(
    String path, {
    Map<String, dynamic>? params,
    bool clearStack = false, // 是否清理页面栈
    bool replace = false,
    TransitionType transition = TransitionType.cupertino,
    Duration? transitionDuration = const Duration(milliseconds: 250),
    RouteSettings? routeSettings, // 路由要进入的页面名及参数
    RouteTransitionsBuilder? transitionBuilder, // 要执行的动画效果
  }) {
    String paramsStr = "";
    if (params != null) {
      int index = 0;

      // 拼接参数
      for (var key in params.keys) {
        final value = Uri.encodeComponent(params[key].toString());
        index == 0 ? paramsStr = "?" : paramsStr = paramsStr + r"&";
        paramsStr += "$key=$value";
        index++;
      }
    }
    path = path + paramsStr;

    return router.navigateTo(
      initGlobalKeyContext!,
      path,
      clearStack: clearStack,
      replace: replace,
      transition: transition,
      transitionDuration: transitionDuration,
      routeSettings: routeSettings,
    );
  }
}
