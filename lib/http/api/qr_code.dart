import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/http/model/qr_code/qr_code.dart';

// 设备连接上线
// type
//    admittance 入场
//    serviceSigning 服务（上课）签到
Future<ScanQRCodeResult> scanQRCodeApi(secret, code, type) async {
  var json = await Http().post(
    '/envoy/decoding',
    data: {
      "secret": secret,
      'code': code,
      'type': type,
    },
  );

  ScanQRCodeResult res = ScanQRCodeResult.fromJson(jsonDecode(json));
  return res;
}
