import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';
import 'package:flutter_sign_in/components/busin/setting_icon_button_bar.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';

enum Page {
  device,
  network,
  about,
  update,
}

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  DateTime? _lastTime;

  // 跳转页面
  goPage(page) {
    switch (page) {
      case Page.device:
        Routers().navigateTo(context, CustomRoute().settingDevice);
        break;
      case Page.network:
        Routers().navigateTo(context, CustomRoute().settingNetwork);
        break;
      case Page.about:
        Routers().navigateTo(context, CustomRoute().settingAbout);
        break;
      case Page.update:
        Routers().navigateTo(context, CustomRoute().settingUpdate);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // 返回键拦截 返回true 代表返回桌面 false代表什么都不做
    return WillPopScope(
      onWillPop:
          // 处理 iOS 手势返回的问题，并且不能清理路由栈信息
          !kIsWeb && Platform.isIOS
              ? null
              : () async {
                  if (kIsWeb) return true;

                  DateTime now = DateTime.now();

                  // 对比两个时间是否相差1秒
                  if (_lastTime == null || now.difference(_lastTime!).inSeconds > 1) {
                    _lastTime = DateTime.now();
                    toast('再点击一次回到扫码界面');
                    return false;
                  } else {
                    Navigator.pop(context);
                    return true;
                  }
                },
      child: CupertinoPageScaffold(
        child: Container(
          margin: EdgeInsets.fromLTRB(21.w, 72.h, 21.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // 设置标题
            children: [
              Text(
                '设置',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),

              // 设备配置
              GestureDetector(
                onTap: () => goPage(Page.device),
                child: SettingBg(
                  leftLine: 53.w,
                  child: SettingBar(
                    imgUrl: Assets.iconSettingConfig,
                    title: '设备配置',
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // 网络配置
              GestureDetector(
                onTap: () => goPage(Page.network),
                child: SettingBg(
                  leftLine: 53.w,
                  child: SettingBar(
                    imgUrl: Assets.iconNetworkConfig,
                    title: '网络配置',
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              // 关于、软件更新
              SettingBg(
                leftLine: 53.r,
                childs: [
                  GestureDetector(
                    onTap: () => goPage(Page.about),
                    child: SettingBar(
                      imgUrl: Assets.iconAbout,
                      title: '关于',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => goPage(Page.update),
                    child: SettingBar(
                      imgUrl: Assets.iconUpdate,
                      title: '软件更新',
                    ),
                  )
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
