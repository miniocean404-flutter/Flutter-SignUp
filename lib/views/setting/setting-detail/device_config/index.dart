import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';

class DeviceConfig extends StatefulWidget {
  const DeviceConfig({Key? key}) : super(key: key);

  @override
  State<DeviceConfig> createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  @override
  Widget build(BuildContext context) {
    // CupertinoPageScaffold
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '设备配置',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      child: Container(
        color: const Color(0xffefeff3),
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 108.h, 20.w, 0),
          child: Column(
            children: [
              SettingBg(
                leftLine: 17.w,
                childs: [
                  // 服务器
                  GestureDetector(
                    child: Container(
                      height: 44.h,
                      margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '服务名称',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          Text(
                            '一个放当前公司名字的地方',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xff8A8A8D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 使用https
                  Container(
                    height: 44.h,
                    margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '摆放位置',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          Text(
                            '负一楼前台',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xff8A8A8D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // 重新登录
              SettingBg(
                leftLine: 16.w,
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '重新登录',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.r,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
