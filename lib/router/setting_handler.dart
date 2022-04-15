// 设置页面
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/views/setting/index.dart';
import 'package:flutter_sign_in/views/setting/setting-detail/about/index.dart';
import 'package:flutter_sign_in/views/setting/setting-detail/device_config/index.dart';
import 'package:flutter_sign_in/views/setting/setting-detail/network_config/index.dart';
import 'package:flutter_sign_in/views/setting/setting-detail/update/index.dart';

final settingHomeHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Setting();
});
final settingAboutHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const About();
});
final settingDeviceHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const DeviceConfig();
});
final settingNetworkHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const NetworkConfig();
});
final settingUpdateHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Update();
});
