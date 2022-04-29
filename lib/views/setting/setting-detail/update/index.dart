import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';
import 'package:flutter_sign_in/http/version.dart';
import 'package:flutter_sign_in/utils/shared_preferences.dart';
import 'package:flutter_sign_in/utils/string_handle.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum PageState {
  loading, // 加载中
  auto, // 自动更新
  noAuto, // 不自动更新
}

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late PageState _currentState = PageState.auto;

  // 当前版本或者最新版本
  late String _version = '';
  late bool _isForceUpdate = false;
  late bool _isNew = false;

  @override
  void initState() {
    super.initState();

    setVersionInfo();
  }

  // 设置当前版本、是否最新、是否强制更新
  void setVersionInfo() async {
    final Map<String, dynamic> versionRes = await getCurrentState();

    final List list = versionRes['list'];

    if (versionRes['count'] > 0) {
      // 获取当前版本信息
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      for (var versionItem in list) {
        _isNew = versionCompare(versionItem['versionCode'], currentVersion);
        _isNew
            ? setState(() {
                _version = versionItem['versionCode'];
                _isForceUpdate = versionItem['isForceUpdate'];
              })
            : setState(() => _version = currentVersion);

        if (_isNew) {
          break;
        }
      }
    }
  }

  // 获取当前自动更新状态，并设置当前页面的状态
  Future<Map<String, dynamic>> getCurrentState() async {
    bool? isAutoUpdate = SpHelper.getLocalStorage('isAutoUpdate');
    if (isAutoUpdate == null || isAutoUpdate == true) {
      _currentState = PageState.auto;
    }

    if (_currentState == PageState.auto) {
      setState(() => _currentState = PageState.loading);

      final Map<String, dynamic> res = await getHistoryVersion();

      setState(() => _currentState = PageState.auto);

      return res;
    }

    throw '没有获取结果';
  }

  void _isAutoUpdateButton(v) {
    setState(() {
      if (v == true) _currentState = PageState.auto;
      if (v == false) _currentState = PageState.noAuto;
    });
  }

  // 是否是加载中的状态
  Widget _isLoading() {
    if (_currentState == PageState.loading) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 144.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(radius: 6, animating: true),
                SizedBox(width: 6.w),
                Text(
                  'Serendipity Envoy 正在检查更新',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff8A8A8D),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Column(
        children: [
          // 自动更新
          SettingBg(
            leftLine: 16.w,
            child: Container(
              height: 44.h,
              margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('自动更新', style: TextStyle(fontSize: 18.sp)),
                  Transform.scale(
                    // 1.r 屏幕放大的倍率也是1个像素放大的倍率
                    scale: 1.r,
                    child: CupertinoSwitch(
                      value: _currentState == PageState.auto,
                      onChanged: _isAutoUpdateButton,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // _isAutoUpdate 控制是否展示界面
          _isShowAutoUpdate()
        ],
      );
    }
  }

  // 是否展示自动更新的状态
  Widget _isShowAutoUpdate() {
    if (_currentState == PageState.auto) {
      return Column(
        children: [
          SizedBox(height: 30.h),
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
                        '最新版本',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Text(
                        'Version $_version',
                        style: TextStyle(
                            fontSize: 18.sp, color: const Color(0xff8A8A8D)),
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
                        '更新建议',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Text(
                        _isForceUpdate ? '强制' : '非强制',
                        style: TextStyle(
                            fontSize: 18.sp, color: const Color(0xff8A8A8D)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30.h),
          // 蓝色更新按钮
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xff0C508F),
              onPressed: () {},
              child: Text(
                '更新',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
          )
        ],
      );
    } else if (_currentState == PageState.noAuto) {
      return Column(
        children: [
          SizedBox(height: 330.h),
          Text(
            'Version $_version',
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff8A8A8D)),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5.w),
              Text(
                'Serendipity Envoy 已是最新版本',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff8A8A8D),
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '软件更新',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 108.h, 20.w, 0),
        child: _isLoading(),
      ),
    );
  }
}
