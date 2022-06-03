import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:path_provider/path_provider.dart';

// 使用 get 下载文件 File API
Future downloadAPKAndSetup(String fileUrl, {String fileName = '文件名.zip'}) async {
  Response res = await Http().get(
    fileUrl,
    options: Options(
      responseType: ResponseType.bytes,
      // 关闭请求重定向
      followRedirects: false,
      // 校验状态码
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  // 下载, 获取存储卡目录，只有 Android 设备可用 (获取外部存储目录 用户可见)
  Directory? externalDir = await getExternalStorageDirectory();
  String fullPath = "${externalDir!.path}/$fileName";

  File file = File(fullPath);
  // 打开文件进行读写的模式。如果文件已经存在，则该文件将被覆盖。如果文件不存在，则创建该文件
  var raf = file.openSync(mode: FileMode.write);
  raf.writeFromSync(res.data);
  await raf.close();
}
