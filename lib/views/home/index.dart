import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('签到'),
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 159.h),
            const Text(
              '签到',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 102.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 160.r,
                height: 160.r,
                child: Container(
                    // child: MobileScanner(
                    //   allowDuplicates: false, // 扫描一次还是(true)多次
                    //   fit: BoxFit.cover,
                    //   controller: MobileScannerController(
                    //     // 相机朝向
                    //     facing: CameraFacing.front,
                    //     torchEnabled: true,
                    //   ),
                    //   // 发现二维码事件
                    //   onDetect: (barcode, args) {
                    //     final String? code = barcode.rawValue;
                    //     debugPrint('二维码 $code');
                    //   },
                    // ),
                    ),
              ),
            ),
            SizedBox(height: 158.h),
            const Text(
              '请向屏幕展示二维码',
              style: TextStyle(color: Color(0xff999999), fontSize: 14.5),
            ),
            const Text(
              '识别后会自动签到',
              style: TextStyle(color: Color(0xff999999)),
            ),
            SizedBox(height: 292.h),
            const Text(
              'Serendipity Envoy',
              style: TextStyle(
                color: Color(0xffCECECE),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
