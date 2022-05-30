import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/version/ger_new_version.dart';
import 'package:flutter_sign_in/model/version/history_version.dart';

Future getHistoryVersion() async {
  var json = await Http().get(
    '/version',
    params: {
      "client": 'envoy',
      'platform': 'iOS',
    },
  );

  HistoryVersion res = HistoryVersion.fromJson(jsonDecode(json));

  return res.data;
}

Future getNewVersion(version) async {
  var json = await Http().get(
    '/version/latest',
    params: {
      "client": 'envoy',
      'platform': 'iOS',
      'versionCode': version,
    },
  );

  GetNewVersion res = GetNewVersion.fromJson(jsonDecode(json));

  if (res.message == '不存在的版本') return null;

  return res.data;
}
