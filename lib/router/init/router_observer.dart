part of fluro_routers;

MyRouteObserver<PageRoute> myRouteObserver = MyRouteObserver<PageRoute>();

// 整个应用程序路由堆栈变化,在material中的navigatorObservers注册
class MyRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    // logger.i('将要push route: $route,previousRoute:$previousRoute');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // logger.i('将要pop route: $route,previousRoute:$previousRoute');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // logger.i('将要替换栈信息 newRoute: $newRoute,oldRoute:$oldRoute');
  }

  @override
  void didRemove(Route? route, Route? previousRoute) {
    super.didRemove(route!, previousRoute);
    // logger.i('将要删除 route: $route,previousRoute:$previousRoute');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    // logger.i('开始用户手势 route: $route,previousRoute:$previousRoute');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // logger.i('更新用户手势');
  }
}
