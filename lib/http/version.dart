import 'dart:convert';

import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/history_version.dart';

Future getHistoryVersion() async {
  var json = await Http()
      .get('/version', params: {"client": 'envoy', 'platform': 'iOS'});

  Map<String, dynamic> res = HistoryVersion.fromJson(jsonDecode(json)).toJson();

  return res['data'];
}
