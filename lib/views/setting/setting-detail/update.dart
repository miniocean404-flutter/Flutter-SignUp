import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/setting_bg.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool _isAutoUpdate = false;

  Widget _isShowAutoUpdate() {
    if (_isAutoUpdate == true) {
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
                        '正常',
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
              child: const Text('更新'),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 330.h),
          Text(
            'Version 0.1.3',
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff8A8A8D)),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoActivityIndicator(radius: 5, animating: true),
              SizedBox(width: 5.w),
              Text(
                'Serendipity Envoy 已是最新版本',
                style:
                    TextStyle(fontSize: 14.sp, color: const Color(0xff8A8A8D)),
              ),
            ],
          )
        ],
      );
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
        color: const Color(0xffefeff3),
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 108.h, 20.w, 0),
          child: Column(
            children: [
              // 自动更新
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
                          '自动更新',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        CupertinoSwitch(
                          value: _isAutoUpdate,
                          onChanged: (v) {
                            setState(() => _isAutoUpdate = v);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // _isAutoUpdate 控制是否展示界面
              _isShowAutoUpdate()
            ],
          ),
        ),
      ),
    );
  }
}
