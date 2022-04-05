import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';

class NetworkConfig extends StatefulWidget {
  const NetworkConfig({Key? key}) : super(key: key);

  @override
  State<NetworkConfig> createState() => _NetworkConfigState();
}

class _NetworkConfigState extends State<NetworkConfig> {
  @override
  Widget build(BuildContext context) {
    // 与安卓的MaterialApp一样 iOS的是CupertinoApp
    // 与安卓的Scaffold一样 iOS的是CupertinoPageScaffold
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '网络配置',
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
                            '服务器',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          Row(
                            children: [
                              Text(
                                '10.1.5.138',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xff8A8A8D)),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.r,
                              ),
                            ],
                          )
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
                            '使用https',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          CupertinoSwitch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // 服务器状态
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
                          '服务器状态',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          '正常',
                          style: TextStyle(
                              fontSize: 18.sp, color: const Color(0xff8A8A8D)),
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
