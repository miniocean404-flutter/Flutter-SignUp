import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/qr_code/qr_code.dart';

// 设备连接上线
// type
//    admittance 入场
//    serviceSigning 服务（上课）签到
Future scanQRCodeApi(secret, code, type) async {
  var json = await Http().post(
    '/envoy/connect',
    data: {
      "secret": secret,
      'code': code,
      'type': type,
    },
  );

  dynamic res = ScanQRCodeResult.fromJson(jsonDecode(json)).toJson();

  return res['data'];
}
