import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(height: 100.h),
            const Text(
              '签到',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 100.h),
            Container(
              width: 100.r,
              height: 100.r,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(height: 100.h),
            const Text(
              '请向屏幕展示二维码',
              style: TextStyle(color: Color(0xff999999), fontSize: 14.5),
            ),
            const Text(
              '识别后会自动签到',
              style: TextStyle(color: Color(0xff999999)),
            ),
            SizedBox(height: 200.h),
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
