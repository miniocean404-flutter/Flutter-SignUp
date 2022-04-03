import 'package:flutter/cupertino.dart';
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
      child: SettingBg(
        childs: [
          GestureDetector(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
