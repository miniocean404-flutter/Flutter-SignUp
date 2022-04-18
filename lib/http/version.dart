import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/model/history_version.dart';
import 'package:flutter_sign_in/utils/logger.dart';

Future getHistoryVersion() async {
  var json = await Http()
      .get('/version', params: {"client": 'envoy', 'platform': 'iOS'});

  logger.i(HistoryVersion.fromJson(json));
  // Map<String, dynamic> res = HistoryVersion.fromJson(json).toJson();

  // logger.i(res);
  // return res['data'];
}
