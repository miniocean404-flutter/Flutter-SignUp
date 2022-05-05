import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

// 安装
// shelf: ^1.3.0
// shelf_proxy: ^1.0.1
// 运行 dart ./script/proxy-server.dart 启动代理服务器

// 前端页面访问本地域名
String localHost = 'localhost';
// 前端页面访问本地端口号
const int localPort = 4040;

// 代理地址
const String targetUrl = 'http://api.uat.serendipity.illiaccess.com';

// 这里设置请求策略，允许所有
void configServer(HttpServer server) {
  server.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);
  server.defaultResponseHeaders.add('Access-Control-Allow-Methods', '*');
  server.defaultResponseHeaders.add('Access-Control-Allow-Headers', '*');
  server.defaultResponseHeaders.add('Access-Control-Max-Age', '3600');
}

// 修复web下shelf_proxy插件没有处理options请求而是直接转发
// 导致可能服务器没有这个options接口而404,进而产生还是会跨域的问题
Handler fixOptions(String targetUrl) {
  return (serverRequest) async {
    Handler h = proxyHandler(targetUrl);

    if (serverRequest.method == 'OPTIONS') return Response(200);
    return h(serverRequest);
  };
}

Future main() async {
  // 内网ip
  for (var interface in await NetworkInterface.list()) {
    for (var addr in interface.addresses) {
      if (addr.type.name == 'IPv4') {
        localHost = addr.address;
      }
    }
  }

  var server = await shelf_io.serve(
    fixOptions(targetUrl),
    localHost,
    localPort,
  );

  configServer(server);

  // ignore: avoid_print
  print('代理服务在:http://${server.address.host}:${server.port}');
}
