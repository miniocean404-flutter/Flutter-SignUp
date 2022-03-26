import 'package:my_app/model/live_room.dart';
import 'package:my_app/model/live_url.dart';
import 'package:my_app/utils/util.dart';

import './config/http_request.dart';

class Platform {
  // 首页推荐
  static Future<List> getRecommendAll(String cid, int pageNum) async {
    var json =
        await Http().get('/top/live/' + cid, params: {"pageNum": pageNum});
    Map<String, dynamic> res = LiveRoom.fromJson(json).toJson();

    if (res['code'] == 200) {
      // logI('getRecommendAll返回数据:$res');
      return res['data'];
    } else {
      toast('服务端请求出错');
      return [];
    }
  }

  static Future<String> getLiveUrl(String? com, String? roomId) async {
    switch (com) {
      case "bilibili":
      // return getBiLiveUrl(roomId);
      default:
        var json = await Http().get('/' + com! + '/real_url/' + roomId!);
        Map<String, dynamic> res = LiveUrl.fromJson(json).toJson();

        if (res['code'] == 200) {
          return res['data']['realUrl'];
        } else {
          toast('服务端请求出错');
          return '';
        }
    }
  }

  // // 平台推荐
  // static Future<LiveRoom> getRecommendByCom(String com, int pageNum) async {
  //   var json = await Http().get('/' + com + '/top_rooms',
  //       params: {"pageNum": pageNum, "pageSize": 15});

  //   return LiveRoom.fromJson(json);
  // }
}
