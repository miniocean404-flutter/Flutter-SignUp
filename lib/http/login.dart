import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/version/ger_new_version.dart';

// 设备连接上线
Future deviceLogin(accessId, password) async {
  var json = await Http().get(
    '/envoy/connect',
    params: {
      "accessId": '187237',
      'password': 'f1c8ec723723',
    },
  );

  dynamic res = GetNewVersion.fromJson(jsonDecode(json)).toJson();

  if (res['message'] == '不存在的版本') return null;

  return res['data'];
}
