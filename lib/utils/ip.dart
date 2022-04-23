import 'dart:io';

import 'package:network_info_plus/network_info_plus.dart';

getLocationPcIp() async {
  // 内网ip
  for (var interface in await NetworkInterface.list()) {
    for (var addr in interface.addresses) {
      if (addr.type.name == 'IPv4') {
        return addr.address;
      }
    }
  }
}

getWifiInfo() async {
  final info = NetworkInfo();
  // var wifiName = await info.getWifiName(); // FooNetwork
  // var wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
  // var wifiIP = await info.getWifiIP(); // 192.168.1.43
  // var wifiIPv6 =
  //     await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
  // var wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
  // var wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
  // var wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1

  return info;
}
