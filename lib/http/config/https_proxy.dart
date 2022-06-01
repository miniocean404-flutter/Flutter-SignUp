// https 抓包代理
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sign_in/config/env/compile_mode.dart';
import 'package:flutter_sign_in/constant/index.dart';

// 文档：https://github.com/flutterchina/dio/blob/master/README-ZH.md#%E8%AE%BE%E7%BD%AEHttp%E4%BB%A3%E7%90%86
// 掘金：https://juejin.cn/post/7029974646137028638
// HttpClientAdapter 主要是方便切换、定制底层网络库。
// 在Flutter中我们可以通过自定义HttpClientAdapter将Http请求转发到Native中，然后再由Native统一发起请求
class HttpsProxy {
  final pem = '';

  HttpsProxy(Dio dio) {
    if (!kIsWeb && getCompileMode2() != CurrentCompileMode.release && START_PACKET_CAPTURE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        // 这一段是解决安卓https抓包的问题
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          if (cert.pem == pem) return true;

          return true;
        };

        // 这是抓包代理
        client.findProxy = (uri) {
          // Flutter Dev Tools本身通过Socket与手机连接，不能使用 localhost，指定具体 手机或电脑 IP PORT
          return "PROXY $PROXY_IP:$PROXY_PROT";
        };

        return HttpClient();
      };
    }
  }
}
