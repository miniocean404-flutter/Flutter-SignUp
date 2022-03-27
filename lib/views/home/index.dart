import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/qr_scanner.dart';
import 'package:flutter_sign_in/components/common/modal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StateType _modalState = StateType.none;

  closeModal() {
    setState(() {
      _modalState = StateType.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('签到'),
      // ),
      body: Center(
        child: StateModal(
          state: _modalState,
          onClose: closeModal,
          bgChild: Column(
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
                  child: const QRScanner(),
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
      ),
    );
  }
}
