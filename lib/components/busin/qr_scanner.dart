import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign_in/utils/plugin/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:device_info_plus/device_info_plus.dart';

class QRScanner extends StatefulWidget {
  final Function(Barcode barcode, MobileScannerArguments? args) onDetect;
  final MobileScannerController controller;

  const QRScanner({Key? key, required this.onDetect, required this.controller}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool? _isOpen = true;

  @override
  void initState() {
    super.initState();
    getCurrentPlatform();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getCurrentPlatform() {
    try {
      if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
        setState(() {
          _isOpen = true;
        });
      } else {
        if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
          setState(() {
            _isOpen = false;
          });
        }
      }
    } on PlatformException {
      setState(() {
        _isOpen = false;
      });
      logger.e('没有找到相关平台');
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return _isOpen == true
        ? MobileScanner(
            allowDuplicates: true, // 扫描一次还是(true)多次
            fit: BoxFit.cover,
            controller: widget.controller,
            // 发现二维码事件
            onDetect: widget.onDetect,
          )
        : const Text('没有被添加的平台');
  }
}
