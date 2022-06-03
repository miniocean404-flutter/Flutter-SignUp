// web内容
// Widget _buildWebView() {
//   return Container(
//     height: _webViewHeight,
//     child: WebView(
//       initialUrl: '$SERVER_API_URL/news/content/${widget.item.id}', //widget.url,
//       javascriptMode: JavascriptMode.unrestricted, // 启用 js
//       // webview 创建时候 保存 webViewController
//       onWebViewCreated: (WebViewController webViewController) async {
//         _controller.complete(webViewController);

//         // String contentBase64 =
//         //     base64Encode(const Utf8Encoder().convert(htmlPage));
//         // await webViewController.loadUrl('data:text/html;base64,$contentBase64');
//       },
//       javascriptChannels: <JavascriptChannel>{
//         _invokeJavascriptChannel(context),
//       },
//       //  点击页面中的 链接 如果不是写入的连接就不跳转，否则就进行跳转
//       navigationDelegate: (NavigationRequest request) {
//         if (request.url != '$SERVER_API_URL/news/content/${widget.item.id}') {
//           toastInfo(msg: request.url);
//           return NavigationDecision.prevent;
//         }
//         return NavigationDecision.navigate;
//       },
//       //  页面开始装载内容时
//       onPageStarted: (String url) {
//         // Timer(Duration(seconds: 1), () {
//         //   setState(() {
//         //     _isPageFinished = true;
//         //   });
//         // _removeAd();
//         // _getViewHeight();
//         // });
//       },
//       //  页面开始装载完成时
//       onPageFinished: (String url) {
//         _getWebViewHeight();
//         setState(() {
//           _isPageFinished = true;
//         });
//       },
//       gestureNavigationEnabled: true,
//     ),
//   );
// }

// 注册 执行js后的 回调
// JavascriptChannel _invokeJavascriptChannel(BuildContext context) {
//   return JavascriptChannel(
//       name: 'Invoke',
//       onMessageReceived: (JavascriptMessage message) {
//         print(message.message);
//         var webHeight = double.parse(message.message);
//         if (webHeight != null) {
//           setState(() {
//             _webViewHeight = webHeight;
//           });
//         }
//       });
// }



// 获取页面高度 evaluateJavascript 会触发_invokeJavascriptChannel回调
// _getWebViewHeight() async {
//   await (await _controller.future)?.evaluateJavascript(
//       '''
//         try {
//           // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
//           let scrollHeight = document.documentElement.scrollHeight;
//           if (scrollHeight) {
//             Invoke.postMessage(scrollHeight);
//           }
//         } catch {}
//         ''');
// }

  // 获取web浏览器像素密度
  // _getWebViewDevicePixelRatio() async {
  //   await (await _controller.future)?.evaluateJavascript('''
  //       try {
  //         Invoke.postMessage(window.devicePixelRatio);
  //       } catch {}
  //       ''');
  // }


// 删除广告
// _removeWebViewAd() async {
//   await (await _controller.future)?.evaluateJavascript('''
//       try {
//         function removeElement(elementName){
//           let _element = document.getElementById(elementName);
//           if(!_element) {
//             _element = document.querySelector(elementName);
//           }
//           if(!_element) {
//             return;
//           }
//           let _parentElement = _element.parentNode;
//           if(_parentElement){
//               _parentElement.removeChild(_element);
//           }
//         }

//         removeElement('module-engadget-deeplink-top-ad');
//         removeElement('module-engadget-deeplink-streams');
//         removeElement('footer');
//       } catch{}
//       ''');
// }