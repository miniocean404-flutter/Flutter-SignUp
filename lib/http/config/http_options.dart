// 请求配置

import 'package:dio/dio.dart';

class HttpOptions {
  // 地址前缀
  static const String baseUrl = 'http://api.uat.serendipity.illiaccess.com';
  // 连接服务器超时时间，单位是毫秒
  static const int connectTimeout = 30000;
  // 接收超时时间，单位是毫秒
  static const int receiveTimeout = 30000;
  //默认值是"application/json; charset=utf-8","Accept:*/*",Headers.formUrlEncodedContentType会自动编码请求体.
  static const Map<String, dynamic>? header = {};
  //共有三种方式json,bytes(响应字节),stream（响应流）,plain
  static const ResponseType responseType = ResponseType.json;
}
