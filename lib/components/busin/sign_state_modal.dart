import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/assets.dart';
import 'package:lottie/lottie.dart';

enum StateType { success, error, loading, none }

class SignStateModal extends StatefulWidget {
  final StateType state; // 状态

  const SignStateModal({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<SignStateModal> createState() => _SignStateModalState();
}

class _SignStateModalState extends State<SignStateModal> {
  final Map<String, dynamic> _currentState = {'state': '', 'img': '', 'tip': ''};

  @override
  void initState() {
    super.initState();

    switch (widget.state) {
      case StateType.success:
        _currentState['state'] = '签到成功';
        _currentState['img'] = Assets.stateIconSuccess;
        _currentState['tip'] = '请前往游泳池区域参与课程';
        break;
      case StateType.error:
        _currentState['state'] = '签到失败';
        _currentState['img'] = Assets.stateIconError;
        _currentState['tip'] = '此处显示签到失败原因，太长的就折行，文字是居中的。';
        break;
      case StateType.loading:
        _currentState['state'] = '';
        _currentState['img'] = Assets.stateIconSuccess;
        _currentState['tip'] = '';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool loadingState = widget.state != StateType.loading;
    final bool noneState = widget.state != StateType.none;

    return Container(
      color: Colors.transparent,
      child: noneState
          ? BackdropFilter(
              //  widget.state != StateType.none
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 265.h,
                    ),
                    // 提示卡片
                    loadingState
                        ? Container(
                            width: 300.w,
                            height: 323.h,
                            decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
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
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Lottie.asset(
                            Assets.lottieLading,
                            width: 150.r,
                            height: 150.r,
                            fit: BoxFit.fill,
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
                    loadingState
                        ? GestureDetector(
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  width: 2.5.r,
                                  color: const Color(0xff999999),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
