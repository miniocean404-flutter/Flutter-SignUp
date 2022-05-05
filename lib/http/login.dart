import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/login/device_connect.dart';

// 设备连接上线
Future deviceLogin(accessId, password) async {
  var json = await Http().post(
    '/envoy/connect',
    data: {
      "accessId": accessId,
      'password': password,
    },
  );

  dynamic res = DeviceConnect.fromJson(jsonDecode(json)).toJson();

  return res['data'];
}
