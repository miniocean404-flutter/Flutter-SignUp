import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: const Color(0xffE5E5E5),
        margin: EdgeInsets.fromLTRB(21.w, 72.h, 21.w, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '设置',
              style: TextStyle(fontSize: 34.sp),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: const BoxDecoration(color: Color(0xffFFFFFf)),
              width: 280.w,
              height: 171.h,
              child: Row(
                children: [
                  Text(
                    '设备配置',
                    style: TextStyle(fontSize: 18.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
