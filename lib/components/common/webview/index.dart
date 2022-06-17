import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/common/webview/utils.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

// runJavascript runJavascriptReturningResult 都可以执行 javascript ,runJavascriptReturningResult 在执行 runJavascriptReturningResult 错误时会显示错误信息

class CustomWebView extends StatefulWidget {
  final String url;
  const CustomWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController _controller;
  late double _webViewHeight = 0;
  late bool isPageRenderFinish = false;
  late String title = '';

  Widget buildWebView() {
    return SizedBox(
      width: double.infinity,
      height: _webViewHeight,
      child: WebView(
        initialUrl: widget.url, //widget.url,
        javascriptMode: JavascriptMode.unrestricted, // 启用 js
        // iOS 中 水平滑动手势是否会触发向后列表导航
        gestureNavigationEnabled: true,
        // webview 创建时候 保存 webViewController
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;

          // String contentBase64 =
          //     base64Encode(const Utf8Encoder().convert(htmlPage));
          // await webViewController.loadUrl('data:text/html;base64,$contentBase64');
        },
        //  页面开始装载内容时
        onPageStarted: (String url) {
          // Timer(Duration(seconds: 1), () {
          //   setState(() {
          //     isPageRenderFinish = true;
          //   });
          // _removeAd();
          // _getViewHeight();
          // });
        },
        //  页面开始装载完成时
        onPageFinished: (String url) async {
          title = await _controller.getTitle() ?? 'webview'; // 获取标题并设置

          // 执行 JavaScript 代码 分发渠道获取页面高度
          getWebViewHeight(_controller);

          setState(() {
            isPageRenderFinish = true;
          });
        },
        onWebResourceError: (WebResourceError error) {
          logger.e(error);
        },
        // 获取 Invoke.postMessage 的消息
        javascriptChannels: <JavascriptChannel>{
          invokeJavascriptChannel(context, (webHeight) {
            setState(() {
              _webViewHeight = webHeight;
            });
          }),
        },
        // 点击页面中的 链接 可以控制 webview 页面跳转,包括页面初始化加载的链接
        navigationDelegate: (NavigationRequest request) {
          if (request.url != 'http://www.baidu.com/') return NavigationDecision.prevent;
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // todo 查看 CupertinoNavigationBar
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      child: buildWebView(),
    );
  }
}
