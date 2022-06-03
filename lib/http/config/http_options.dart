// 请求配置

import 'package:dio/dio.dart';
import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/config/env/get_env.dart';

class HttpOptions {
  static final HttpOptions _instance = HttpOptions._internal();
  factory HttpOptions() => _instance;

  // 地址前缀
  late final String baseUrl;
  // 连接服务器超时时间，单位是毫秒
  late final int connectTimeout = 30000;
  // 接收超时时间，前后两次接受到数据的间隔，单位是毫秒
  late final int receiveTimeout = 30000;
  //默认值是"application/json; charset=utf-8","Accept:*/*",Headers.formUrlEncodedContentType会自动编码请求体.
  late final Map<String, dynamic>? header = {};
  //共有三种方式 json , bytes(响应字节) , stream（响应流）,plain
  // 如果想以文本(字符串)格式接收响应数据，请使用 `plain`.
  late final ResponseType responseType = ResponseType.json;

  /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
  /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
  /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
  /// 就会自动编码请求体.
  late final String contentType = 'application/json; charset=utf-8';

  HttpOptions._internal() {
    CurrentEnv config = getEnvironmentConfig();
    baseUrl = config.getBaseUrl;
  }
}
