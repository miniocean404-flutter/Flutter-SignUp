import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/webview/utils.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 可以通过 AssetBundle.root
class CustomWebView extends StatefulWidget {
  final String url;
  final String? limitUrl;
  const CustomWebView({Key? key, required this.url, this.limitUrl}) : super(key: key);

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  // Completer 可以将回调延迟执行，等待 _controller.feature 完成
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  late String title = 'webview';
  final String userAgentPC = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36';
  final String userAgentIOS =
      'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1';

  @override
  void initState() {
    super.initState();

    if (!kIsWeb && Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Widget buildWebView() {
    final limitUrl = widget.limitUrl ?? '';

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted, // 启用 js
        gestureNavigationEnabled: true, // iOS 中 水平滑动手势是否会触发向后列表导航
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow, // 播放媒体的策略
        allowsInlineMediaPlayback: true, // 控制是否允许在 iOS 上在线播放 HTML5 视频
        debuggingEnabled: false, // 是否启用webview调试
        backgroundColor: Colors.transparent, // 未加载时背景色
        initialCookies: const [], // 要设置的初始 cookie
        zoomEnabled: true, // WebView 是否应支持使用其屏幕缩放控件和手势进行缩放
        // userAgent: userAgentIOS,
        // gestureRecognizers: , // Web 视图应该使用哪些手势

        // webview 创建时候 保存 webViewController
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },

        //  页面开始装载内容时
        onPageStarted: (String url) {},

        //  页面开始装载完成时
        onPageFinished: (String url) async {
          final String res = await (await _controller.future).getTitle() ?? 'webview'; // 获取标题并设置
          setState(() {
            title = res;
          });
        },

        // 页面渲染错误时
        onWebResourceError: (WebResourceError error) {
          logger.e(error);
        },

        // 获取 Invoke.postMessage 的消息
        javascriptChannels: <JavascriptChannel>{
          invokeJavascriptChannel(context, (webHeight) {}),
        },

        // 点击页面中的 链接 可以控制 webview 页面跳转,包括页面初始化加载的链接
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.contains(limitUrl)) return NavigationDecision.prevent;
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      child: !kIsWeb ? buildWebView() : Container(),
    );
  }
}
