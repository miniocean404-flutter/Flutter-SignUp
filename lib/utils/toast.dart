import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

// SnackBar的调用必须是在main.dart中是MaterialApp 且 页面中是Scaffold才能使用
void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  final message = ScaffoldMessenger.of(context);

  message.showSnackBar(snackBar);
}
