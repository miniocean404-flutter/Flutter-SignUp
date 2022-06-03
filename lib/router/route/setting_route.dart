// 设置页面
part of fluro_routers;

mixin SettingRoute {
  final String settingHome = "/settingHome";
  final String settingAbout = "/settingAbout";
  final String settingDevice = "/settingDevice";
  final String settingNetwork = "/settingNetwork";
  final String settingUpdate = "/settingUpdate";

  final settingHomeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Setting();
  });

  final settingAboutHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const About();
  });

  final settingDeviceHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const DeviceConfig();
  });

  final settingNetworkHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const NetworkConfig();
  });

  final settingUpdateHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Update();
  });
}
