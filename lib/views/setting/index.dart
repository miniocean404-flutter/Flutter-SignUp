import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';

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
        color: const Color(0xffefeff3),
        child: Container(
          margin: EdgeInsets.fromLTRB(21.w, 72.h, 21.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '设置',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              SettingBg(
                child: [
                  SizedBox(
                    height: 44.h,
                    child: Row(
                      children: [
                        SizedBox(width: 11.w),
                        SizedBox(width: 30.r, height: 30.r),
                        Text(
                          '设备配置',
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SettingBg(
                child: [
                  SizedBox(
                    height: 44.h,
                    child: Row(
                      children: [
                        SizedBox(width: 11.w),
                        SizedBox(width: 30.r, height: 30.r),
                        Text(
                          '网络配置',
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
