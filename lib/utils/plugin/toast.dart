import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg) async {
  // 修复web没有实现toast取消方法
  if (!kIsWeb) {
    await Fluttertoast.cancel();
  }

  await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 12.0,
  );
}

// SnackBar的调用必须是在 main.dart 中是 MaterialApp 且 页面中是Scaffold才能使用
void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  final message = ScaffoldMessenger.of(context);

  message.showSnackBar(snackBar);
}
