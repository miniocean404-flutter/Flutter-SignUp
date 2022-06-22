import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components_busin/setting_bg.dart';
import 'package:flutter_sign_in/components_busin/setting_icon_button_bar.dart';
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
  final List<dynamic> list = [
    [
      {'title': '设备配置', 'imgUrl': Assets.iconSettingConfig, 'page': Page.device}
    ],
    [
      {'title': '网络配置', 'imgUrl': Assets.iconNetworkConfig, 'page': Page.network}
    ],
    [
      {'title': '关于', 'imgUrl': Assets.iconAbout, 'page': Page.about},
      {'title': '软件更新', 'imgUrl': Assets.iconUpdate, 'page': Page.update}
    ]
  ];

  // 跳转页面
  goPage(page) {
    switch (page) {
      case Page.device:
        Routers().navigateTo(CustomRoute().settingDevice);
        break;
      case Page.network:
        Routers().navigateTo(CustomRoute().settingNetwork);
        break;
      case Page.about:
        Routers().navigateTo(CustomRoute().settingAbout);
        break;
      case Page.update:
        Routers().navigateTo(CustomRoute().settingUpdate);
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
        child: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('设置'),
              automaticallyImplyLeading: false,
            ),
            const CupertinoSliverRefreshControl(
                // onRefresh: () {
                //   return 1;
                // },
                ),
            SliverPadding(
              padding: MediaQuery.of(context).removePadding(removeTop: true).padding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (list[index] is List) {
                      List<dynamic> listItem = list[index];

                      final List<Widget> listWidget = listItem.map((e) {
                        final String title = e['title'] ?? '';
                        final String imgUrl = e['imgUrl'] ?? '';
                        final Page page = e['page'];

                        return GestureDetector(
                          onTap: () => goPage(page),
                          child: SettingBar(
                            imgUrl: imgUrl,
                            title: title,
                          ),
                        );
                      }).toList();

                      return Container(
                        margin: EdgeInsets.fromLTRB(21.w, 21.h, 21.w, 0),
                        child: SettingBg(
                          leftLine: 53.w,
                          childs: listWidget,
                        ),
                      );
                    }

                    return null;
                  },
                  childCount: list.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
