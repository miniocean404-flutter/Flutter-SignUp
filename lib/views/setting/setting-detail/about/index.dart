import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:flutter_sign_in/config/constant/index.dart';
import 'package:flutter_sign_in/provider/version.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/system/index.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutConfigState();
}

class _AboutConfigState extends State<About> {
  @override
  Widget build(BuildContext context) {
    String? version = Provider.of<Version>(context).getVersion;

    return CupertinoPageScaffold(
      // todo 查看 CupertinoNavigationBar
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(),
        transitionBetweenRoutes: !kIsWeb && Platform.isIOS,
        middle: Text(
          '关于',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context, '数据传参'),
          child: Container(
            width: 42.0,
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Image.asset(
              Assets.arrowLeftGray,
              color: Colors.blue,
              // color: CustomAppColor.of(context).color202326,
            ),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
        child: Column(
          children: [
            SettingBg(
              leftLine: 17.w,
              childs: [
                // 版本
                GestureDetector(
                  child: Container(
                    height: 44.h,
                    margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '版本',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          'Version $version',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: '#8A8A8D'.toColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 更新日志
                GestureDetector(
                  onTap: () {
                    if (kIsWeb) return;

                    Routers().navigateTo(CustomRoute().webview, params: {'url': 'https://www.bilibili.com/'});
                  },
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColor.of(context).currentMode.secondary,
                    ),
                    margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '更新日志',
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
            SizedBox(height: 30.h),

            // 服务器状态
            GestureDetector(
              onTap: () {
                if (kIsWeb) return;
                Routers().navigateTo(CustomRoute().webview, params: {'url': 'http://www.baidu.com'});
              },
              child: SettingBg(
                leftLine: 16.w,
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '软件生态',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
