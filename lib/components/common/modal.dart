import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/assets.dart';

enum StateType { success, error, loading, none }

class StateModal extends StatefulWidget {
  final StateType state; // 状态
  final Widget bgChild; // 被当做背景的组件
  final GestureTapCallback? onClose;

  const StateModal({
    Key? key,
    required this.state,
    required this.bgChild,
    this.onClose,
  }) : super(key: key);

  @override
  State<StateModal> createState() => _StateModalState();
}

class _StateModalState extends State<StateModal> {
  final Map<String, dynamic> _currentState = {
    'state': '',
    'img': '',
    'tip': ''
  };

  @override
  void initState() {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        widget.bgChild,
        widget.state != StateType.none
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 265.h,
                      ),
                      // 提示卡片
                      Container(
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
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff999999),
                          ),
                        ),
                      ),
                      SizedBox(height: 72.5.h),
                      // 关闭按钮
                      GestureDetector(
                        // '按下时回调'
                        onTapDown: (TapDownDetails tapDownDetails) {},
                        // '抬起时回调'
                        onTapUp: (TapUpDetails tapUpDetails) {},
                        // '点击事件回调'
                        onTap: widget.onClose,
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
                      ),
                    ],
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
