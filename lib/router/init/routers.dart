part of fluro_routers;

// 函数导入

//省略 import
class Routers {
  static final Routers _instance = Routers._in();

  factory Routers() => _instance;

  Routers._in() {
    router = InitFluroRouter().router;
    routeObserver = RouteObserver<PageRoute>();
    allRouteObserver = myRouteObserver;
    route = CustomRoute();
  }

  late final FluroRouter router; // FluroRouter 路由
  late final CustomRoute route; // 所有路由页

  late final RouteObserver<PageRoute> routeObserver; // 页面级路由监听
  late final RouteObserver<PageRoute> allRouteObserver; // 整个应用的路由监听

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  final FluroRouterNavigateTo navigateTo = InitFluroRouter().navigateTo;

  // dialog 函数
  final showDialogRouter = InitFluroRouter().showDialogRouter;
  final showDialogNative = InitFluroRouter().showDialogNative;
  final showHero = InitFluroRouter().showHero;
  final bottomPopUpRouter = InitFluroRouter().bottomPopUpRouter;
}
