import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';
import 'package:flutter_sign_in/http/version.dart';
import 'package:flutter_sign_in/utils/shared_preferences.dart';
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

  // 是否自动更新
  late String _version = '';

  @override
  void initState() {
    super.initState();

    getCurrentState();

    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() => {_version = packageInfo.version});
    });
  }

  // 获取当前自动更新状态，并设置当前页面的状态
  void getCurrentState() async {
    bool? isAutoUpdate = SpHelper.getLocalStorage('isAutoUpdate');
    if (isAutoUpdate == null || isAutoUpdate == true) {
      _currentState = PageState.auto;
    }

    if (_currentState == PageState.auto) {
      setState(() {
        _currentState = PageState.loading;
      });

      final value = await getHistoryVersion();

      setState(() {
        _currentState = PageState.auto;
      });
    }
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
                    scale: 1.5.r,
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
                        '正常',
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
                        '非强制',
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
