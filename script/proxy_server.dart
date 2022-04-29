import 'dart:io';

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
    proxyHandler(targetUrl),
    localHost,
    localPort,
  );

  // 添加上跨域的这几个header
  server.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  // ignore: avoid_print
  print('代理服务在:http://${server.address.host}:${server.port}');
}
