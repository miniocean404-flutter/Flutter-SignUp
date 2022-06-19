import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/components/webview/index.dart';

// runJavascript runJavascriptReturningResult 都可以执行 javascript ,runJavascriptReturningResult 在执行 runJavascriptReturningResult 错误时会显示错误信息

class BusinWebView extends StatefulWidget {
  final String url;
  const BusinWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<BusinWebView> createState() => _BusinWebViewState();
}

class _BusinWebViewState extends State<BusinWebView> {
  @override
  Widget build(BuildContext context) {
    return CustomWebView(
      url: widget.url,
    );
  }
}
