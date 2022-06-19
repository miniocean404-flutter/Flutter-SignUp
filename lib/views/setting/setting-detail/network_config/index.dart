import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components_busin/setting_bg.dart';
import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/config/env/get_env.dart';
import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:flutter_sign_in/utils/system/index.dart';

class NetworkConfig extends StatefulWidget {
  const NetworkConfig({Key? key}) : super(key: key);

  @override
  State<NetworkConfig> createState() => _NetworkConfigState();
}

class _NetworkConfigState extends State<NetworkConfig> {
  bool _isUseHttps = false; // 是否https
  late String showServe = ''; // 当前服务器地址

  @override
  void initState() {
    super.initState();

    setServeAddress();
    getIsUseHttpsState();
  }

  // 设置展示的服务器地址
  void setServeAddress() async {
    CurrentEnv config = getEnvironmentConfig();
    dynamic baseUrl = SpHelper.getLocalStorage('baseUrl');
    if (baseUrl == null) {
      baseUrl = config.getBaseUrl;

      await SpHelper.setLocalStorage('baseUrl', baseUrl);
    }
    baseUrl = SpHelper.getLocalStorage('baseUrl');

    // 将地址特换为展示效果
    RegExp reg = RegExp(r"\/\/([\d\w.]+)", multiLine: true, unicode: true);
    final simpleUrl = reg.firstMatch(baseUrl)?.group(1);

    setState(() => showServe = simpleUrl!);
  }

  // 获取https状态
  void getIsUseHttpsState() async {
    String baseUrl = SpHelper.getLocalStorage('baseUrl');
    final bool isHttps = baseUrl.contains('https');

    setState(() => _isUseHttps = isHttps);
  }

  // 切换是否使用https
  void isUseHttpsButton(v) async {
    String url = SpHelper.getLocalStorage('baseUrl');
    RegExp findReg = RegExp(v ? 'http' : 'https');
    String beReplaced = v ? 'https' : 'http';
    final replaceUrl = url.replaceAll(findReg, beReplaced);

    // 设置地址
    Http().init(baseUrl: replaceUrl);
    await SpHelper.setLocalStorage('baseUrl', replaceUrl);

    setState(() => _isUseHttps = v);
  }

  @override
  Widget build(BuildContext context) {
    // 与安卓的MaterialApp一样 iOS的是CupertinoApp
    // 与安卓的Scaffold一样 iOS的是CupertinoPageScaffold
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '网络配置',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
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
                              showServe,
                              style: TextStyle(fontSize: 18.sp, color: '#8A8A8D'.toColor()),
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
                  key: ValueKey('$_isUseHttps'),
                  height: 44.h,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('使用https', style: TextStyle(fontSize: 18.sp)),
                      Transform.scale(
                        scale: 1.r,
                        alignment: Alignment.centerRight,
                        child: CupertinoSwitch(
                          value: _isUseHttps,
                          onChanged: isUseHttpsButton,
                        ),
                      )
                    ],
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
                        style: TextStyle(fontSize: 18.sp, color: '#8A8A8D'.toColor()),
                      ),
                    ],
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
