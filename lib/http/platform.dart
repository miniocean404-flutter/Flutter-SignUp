import 'package:flutter_sign_in/model/history_version.dart';
import 'package:flutter_sign_in/utils/logger.dart';

import './config/http_request.dart';

class Version {
  // 首页推荐
  static Future getHistoryVersion() async {
    var json = await Http()
        .get('/version', params: {"client": 'envoy', 'platform': 'iOS'});

    Map<String, dynamic> res = HistoryVersion.fromJson(json).toJson();

    logger.i(res);
    return res['data'];
  }
}
