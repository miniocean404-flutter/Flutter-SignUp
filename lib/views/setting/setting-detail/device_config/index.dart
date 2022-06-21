import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components_busin/setting_bg.dart';
import 'package:flutter_sign_in/http/api/login.dart';
import 'package:flutter_sign_in/http/model/login/device_connect.dart';
import 'package:flutter_sign_in/provider/busin_status.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:flutter_sign_in/utils/system/index.dart';
import 'package:provider/provider.dart';

class DeviceConfig extends StatefulWidget {
  const DeviceConfig({Key? key}) : super(key: key);

  @override
  State<DeviceConfig> createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  late String serverName = '';
  late String location = '';
  late String currentBusin = Provider.of<BusinStatus>(context).getBusin ?? '';

  @override
  void initState() {
    super.initState();
    login();
  }

  Future<void> login() async {
    final DeviceConnect res = await deviceLogin(187237, 'f1c8ec723723');
    await SpHelper.setLocalStorage('token', res.data?.accessSecret);
    setState(() {
      location = res.data?.cool?.placement ?? '';
      serverName = res.data?.cool?.serviceName ?? '';
    });
  }

  // 切换业务状态
  toogleBusinStatus() async {
    final BusinStatus businProvider = Provider.of<BusinStatus>(context, listen: false);
    final String toggle = businProvider.getBusin != null && businProvider.getBusin == '签到' ? '上下课' : '签到';

    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('提示'),
          message: const Text('是否要切换签到功能'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () async {
                Provider.of<BusinStatus>(context, listen: false).setBusin = toggle;
                Navigator.of(context).pop();
                await SpHelper.setLocalStorage('busin', toggle);
              },
              // 颜色是否变为红色提示
              // isDestructiveAction: true,
              isDefaultAction: true,
              child: Text(toggle),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('取消'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  void reLogin() async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('提示'),
          content: const Text('确认重新登录吗？'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('确认'),
              onPressed: () async {
                Navigator.of(context).pop();
                await login();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // CupertinoPageScaffold
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // leading: Icon(Icons.arrow_back), // 左侧组件
        // previousPageTitle: '返回', // 左侧返回按钮的文字
        // trailing: const Icon(Icons.add), // 右侧组件
        // backgroundColor: Colors.blue.shade100, // 背景色
        // brightness: Brightness.light, // 上方电量，事件，Wifi 等状态栏颜色
        // 内边距，用来调节所有子组件上下左右偏移
        // padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
        // border: const Border(bottom: BorderSide(color: Colors.red, width: 1)),
        // 是否添加默认 leading，默认为 true。当 leading 为空会默认添加一个返回按钮
        automaticallyImplyMiddle: true,
        // 是否添加默认 middle，默认为 true，如果 middle 为空，且当前 route 为 CupertinoPageRoute，会默认填充 route.title
        // Navigator.push(context,CupertinoPageRoute(builder:()=>{},title:'名字'))
        automaticallyImplyLeading: true,
        middle: Text(
          '设备配置',
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
                          '服务名称',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          serverName,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: '#8A8A8D'.toColor(),
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
                          location,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: '#8A8A8D'.toColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.h),

            // 切换自动签到功能
            GestureDetector(
              onTap: () => toogleBusinStatus(),
              child: SettingBg(
                leftLine: 16.w,
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '切换自动签到功能',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 12.w, 0),
                            child: Consumer<BusinStatus>(
                              builder: ((context, value, child) {
                                final String text = value.getBusin ?? '';

                                return Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: '#8A8A8D'.toColor(),
                                  ),
                                );
                              }),
                            ),
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
            ),

            SizedBox(height: 30.h),

            // 重新登录
            GestureDetector(
              onTap: () => reLogin(),
              child: SettingBg(
                leftLine: 16.w,
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
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
            ),
          ],
        ),
      ),
    );
  }
}
