import 'package:flutter_sign_in/model/test.dart';
import './config/http_request.dart';

class Platform {
  // 首页推荐
  static Future<List> getRecommendAll(String cid, int pageNum) async {
    var json =
        await Http().get('/top/live/' + cid, params: {"pageNum": pageNum});
    Map<String, dynamic> res = Test.fromJson(json).toJson();

    return res['data'];
  }
}
