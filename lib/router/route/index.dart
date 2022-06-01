part of fluro_routers;

class CustomRoute with InitRoute, SettingRoute {
  static final CustomRoute _instance = CustomRoute._internal();

  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory CustomRoute() => _instance;

  late final FluroRouter router;

  CustomRoute._internal() {
    router = InitFluroRouter().router;
  }

  void defineRoutes() {
    // 处理找不到页面情况
    router.notFoundHandler = _instance.page404Handler;

    // 初始界面
    router.define(_instance.splash, handler: _instance.splashHandler);
    router.define(_instance.home, handler: _instance.homeHandler);

    // 设置界面
    router.define(_instance.settingHome, handler: _instance.settingHomeHandler);
    router.define(_instance.settingAbout, handler: _instance.settingAboutHandler);
    router.define(_instance.settingNetwork, handler: _instance.settingNetworkHandler);
    router.define(_instance.settingDevice, handler: _instance.settingDeviceHandler);
    router.define(_instance.settingUpdate, handler: _instance.settingUpdateHandler);

    //
  }
}
