part of fluro_routers;

// 函数导入

//省略 import
class Routers {
  static final Routers _instance = Routers._in();

  factory Routers() => _instance;

  late final RouteObserver<PageRoute> routeObserver; // 页面级路由监听
  late final RouteObserver<PageRoute> allRouteObserver; // 整个应用的路由监听

  // 所有路由页
  late final CustomRoute route;

  // 对 FluroRouter 路由 封装
  late final InitFluroRouter initFluroRouter;
  late final FluroRouter router; // FluroRouter 路由

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  late final FluroRouterNavigateTo navigateTo;
  late final FluroRouterGenerator generator;

  // dialog 函数
  late final Function showDialogRouter;
  late final Function showDialogNative;
  late final Function showHero;
  late final Function bottomPopUpRouter;

  Routers._in() {
    initFluroRouter = InitFluroRouter();
    router = initFluroRouter.router;

    navigateTo = initFluroRouter.navigateTo;
    generator = initFluroRouter.generator;
    showDialogRouter = initFluroRouter.showDialogRouter;
    showDialogNative = initFluroRouter.showDialogNative;
    showHero = initFluroRouter.showHero;
    bottomPopUpRouter = initFluroRouter.bottomPopUpRouter;

    routeObserver = RouteObserver<PageRoute>();
    allRouteObserver = myRouteObserver;
    route = CustomRoute();
  }
}
