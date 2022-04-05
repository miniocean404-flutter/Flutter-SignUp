import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_icon_button_bar.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';
import 'package:flutter_sign_in/router/routers.dart';

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
  // 跳转页面
  goPage(page) {
    switch (page) {
      case Page.device:
        Routers.navigateTo(context, Routers.settingDevice);
        break;
      case Page.network:
        Routers.navigateTo(context, Routers.settingNetwork);
        break;
      case Page.about:
        Routers.navigateTo(context, Routers.settingAbout);
        break;
      case Page.update:
        Routers.navigateTo(context, Routers.settingUpdate);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        width: double.infinity,
        color: const Color(0xffefeff3),
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
                  child: const SettingBar(title: '设备配置'),
                ),
              ),

              SizedBox(height: 30.h),

              // 网络配置
              GestureDetector(
                onTap: () => goPage(Page.network),
                child: SettingBg(
                  leftLine: 53.w,
                  child: const SettingBar(title: '网络配置'),
                ),
              ),
              SizedBox(height: 30.h),

              // 关于、软件更新
              SettingBg(
                leftLine: 53.r,
                childs: [
                  GestureDetector(
                    onTap: () => goPage(Page.about),
                    child: const SettingBar(title: '关于'),
                  ),
                  GestureDetector(
                    onTap: () => goPage(Page.update),
                    child: const SettingBar(title: '软件更新'),
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
