// runJavascript runJavascriptReturningResult 都可以执行 javascript ,runJavascriptReturningResult 在执行 runJavascriptReturningResult 错误时会显示错误信息
// flutter 也可以直接调用 js 中的任何方法

// 获取web浏览器像素密度
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

// onWebViewCreated 钩子时候创建 html 文件
createAssetsHTML(String htmlPage, WebViewController controller) async {
  String contentBase64 = base64Encode(const Utf8Encoder().convert(htmlPage));
  await controller.loadUrl('data:text/html;base64,$contentBase64');
}

//  从本地加载html文件，需要使用异步操作
loadHtmlFromAssets(WebViewController controller, {String path = 'assets/html/JavaScriptTest.html'}) async {
  String fileText = await rootBundle.loadString(path);

  controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
}

// 注册 执行 js 后分发事件的参数的 回调 (获取 web 页面高度)
JavascriptChannel invokeJavascriptChannel(BuildContext context, Function cb) {
  return JavascriptChannel(
    name: 'Invoke', // js 方调用协议名 Invoke.postMessage()
    onMessageReceived: (JavascriptMessage message) {
      debugPrint(message.message);
      var webHeight = double.parse(message.message);
      cb(webHeight);
    },
  );
}

// 获取页面高度 evaluateJavascript 会触发_invokeJavascriptChannel回调
getWebViewHeight(WebViewController controller) async {
  await controller.runJavascript('''
        try {
          // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
          let scrollHeight = document.documentElement.scrollHeight;
          if (scrollHeight) {
            Invoke.postMessage(scrollHeight);
          }
        } catch {}
        ''');
}

// 获取页面像素比例
getWebViewDevicePixelRatio(WebViewController controller) async {
  await controller.runJavascriptReturningResult('''
        try {
          Invoke.postMessage(window.devicePixelRatio);
        } catch {}
        ''');
}

// 删除广告
removeWebViewAd(WebViewController controller) async {
  await controller.runJavascriptReturningResult('''
      try {
        function removeElement(elementName){
          let _element = document.getElementById(elementName);
          if(!_element) {
            _element = document.querySelector(elementName);
          }
          if(!_element) {
            return;
          }
          let _parentElement = _element.parentNode;
          if(_parentElement){
              _parentElement.removeChild(_element);
          }
        }

        removeElement('module-engadget-deeplink-top-ad');
        removeElement('module-engadget-deeplink-streams');
        removeElement('footer');
      } catch{}
      ''');
}
