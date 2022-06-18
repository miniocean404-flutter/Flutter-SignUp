import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:flutter_sign_in/utils/system/index.dart';
import 'package:lottie/lottie.dart';

enum StateType { success, error, loading }

class SignStateModal extends StatefulWidget {
  final StateType state; // 状态
  final int? delay;
  final String? tip;

  const SignStateModal({Key? key, required this.state, this.delay, this.tip}) : super(key: key);

  @override
  State<SignStateModal> createState() => _SignStateModalState();
}

class _SignStateModalState extends State<SignStateModal> {
  final Map<String, dynamic> _currentState = {'state': '', 'img': '', 'tip': ''};
  late Timer? _timer;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      toggleShowText(widget.tip);
      autoClose(widget.delay);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void toggleShowText(tip) {
    switch (widget.state) {
      case StateType.success:
        _currentState['state'] = '签到成功';
        _currentState['img'] = Assets.stateIconSuccess;
        break;
      case StateType.error:
        _currentState['state'] = '签到失败';
        _currentState['img'] = Assets.stateIconError;
        break;
      case StateType.loading:
        _currentState['state'] = '';
        _currentState['img'] = Assets.stateIconSuccess;
        break;
      default:
    }

    _currentState['tip'] = tip ?? '';
  }

  void autoClose(delay) {
    if (delay > 0) {
      _timer = Timer.periodic(Duration(milliseconds: delay), (timer) {
        Navigator.pop(context);
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = widget.state == StateType.loading;

    return Container(
        color: Colors.transparent,
        child: BackdropFilter(
          //  widget.state != StateType.none
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 265.h,
                ),
                // 提示卡片
                isLoading
                    ? Lottie.asset(
                        Assets.lottieLading,
                        width: 150.r,
                        height: 150.r,
                        fit: BoxFit.fill,
                      )
                    : Container(
                        width: 300.w,
                        height: 323.h,
                        decoration: BoxDecoration(
                          color: '#FFFFFF'.toColor(),
                          borderRadius: const BorderRadius.all(Radius.circular(18)),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 4,
                              blurRadius: 50,
                              color: Color.fromRGBO(0, 0, 0, 0.18),
                            )
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 50.h),
                              Image.asset(
                                _currentState['img'],
                                width: 141.67.r,
                                height: 141.67.r,
                              ),
                              SizedBox(height: 36.h),
                              Text(
                                _currentState['state'],
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400,
                                  color: '#000000'.toColor(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 50.h),

                // 提示语
                SizedBox(
                  width: 216.w,
                  child: Text(
                    _currentState['tip'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff999999),
                    ),
                  ),
                ),
                SizedBox(height: 72.5.h),

                // 关闭按钮
                isLoading
                    ? Container()
                    : GestureDetector(
                        // '按下时回调'
                        onTapDown: (TapDownDetails tapDownDetails) {},
                        // '抬起时回调'
                        onTapUp: (TapUpDetails tapUpDetails) {},
                        // '点击事件回调'
                        onTap: () {
                          Navigator.pop(context);
                        },
                        // '点击取消事件回调'
                        onTapCancel: () {},
                        child: Container(
                          width: 35.r,
                          height: 35.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                            border: Border.all(
                              width: 2.5.r,
                              color: const Color(0xff999999),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: 30.r,
                              color: const Color(0xff999999),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
