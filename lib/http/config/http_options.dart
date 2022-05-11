// 请求配置

import 'package:dio/dio.dart';
import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/config/env/get_env.dart';
import 'package:flutter_sign_in/utils/logger.dart';

class HttpOptions {
  static final HttpOptions _instance = HttpOptions._internal();
  factory HttpOptions() => _instance;

  // 地址前缀
  late final String baseUrl;
  // 连接服务器超时时间，单位是毫秒
  late final int connectTimeout = 30000;
  // 接收超时时间，单位是毫秒
  late final int receiveTimeout = 30000;
  //默认值是"application/json; charset=utf-8","Accept:*/*",Headers.formUrlEncodedContentType会自动编码请求体.
  late final Map<String, dynamic>? header = {};
  //共有三种方式json,bytes(响应字节),stream（响应流）,plain
  late final ResponseType responseType = ResponseType.json;

  HttpOptions._internal() {
    CurrentEnv config = getEnvironmentConfig();
    logger.i(config.getBaseUrl);
    baseUrl = config.getBaseUrl;
  }
}
