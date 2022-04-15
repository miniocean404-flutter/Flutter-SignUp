import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/up_down_class_card.dart';
import 'package:flutter_sign_in/components/common/modal.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:flutter_sign_in/utils/toast.dart';
import 'package:video_player/video_player.dart';

enum BusinState {
  sign,
  upDownClass,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller; // 播放控制器
  int _clickNum = 0;

  StateType _modalState = StateType.none; // 弹窗状态
  final BusinState _businState = BusinState.sign; // 当前业务模式

  bool teachIsSign = false; // 老师是否签到
  bool childrenIsSign = false; // 学生是否签到
  bool isHavaVideoLink = true; // 是否有视频链接

  // 初始化声明周期
  @override
  void initState() {
    super.initState();
    initVideo();
  }

  // 页面栈弹出声明周期
  @override
  void deactivate() {
    super.deactivate();
  }

  // 页面彻底销毁声明周期
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 初始化视频
  initVideo() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    setState(() {
      _controller.setLooping(true);
      _controller.play();
    });

    // 设置属性后初始化
    _controller.initialize().then((v) {
      setState(() {});
    });
  }

  // 关闭弹窗
  closeModal() {
    setState(() {
      _modalState = StateType.none;
    });
  }

  // 进入设置界面
  goSetting() {
    _clickNum++;
    if (_clickNum > 5 && _clickNum < 10) {
      toast('再点击5次进入设置界面');
    } else if (_clickNum >= 10) {
      _clickNum = 0;
      Routers.navigateTo(context, Routers.settingHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = _businState == BusinState.sign ? '签到' : '上下课';

    return CupertinoPageScaffold(
      child: Center(
        child: StateModal(
          state: _modalState,
          onClose: closeModal,
          bgChild: Stack(
            alignment: Alignment.center,
            children: [
              // 背景视屏
              _businState == BusinState.sign
                  ? Transform.scale(
                      // 将宽度保持与设备宽度一致的最大放大数值 设备宽度可使用：window.physicalSize.aspectRatio || MediaQuery.of(context).size.aspectRatio
                      scale: _controller.value.aspectRatio /
                          window.physicalSize.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),

              Column(
                children: [
                  SizedBox(height: 159.h),

                  // 签到标题
                  GestureDetector(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w600,
                        color: isHavaVideoLink
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff000000),
                      ),
                    ),
                    onTap: goSetting,
                  ),
                  SizedBox(height: 102.h),

                  // 扫码
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 160.r,
                      height: 160.r,
                      // child: const QRScanner(),
                    ),
                  ),
                  SizedBox(height: 158.h),

                  // 老师或者学生签到后不显示
                  teachIsSign || childrenIsSign
                      ? Container()
                      : Column(
                          children: [
                            Text(
                              '请向屏幕展示二维码',
                              style: TextStyle(
                                color: isHavaVideoLink
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff999999),
                                fontSize: 14.5.sp,
                              ),
                            ),
                            Text(
                              '识别后会自动签到',
                              style: TextStyle(
                                color: isHavaVideoLink
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff999999),
                              ),
                            ),
                            SizedBox(height: 292.h),
                            Text(
                              'Serendipity Envoy',
                              style: TextStyle(
                                color: isHavaVideoLink
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xffCECECE),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                ],
              ),

              //  学生上课下课card
              teachIsSign
                  ? UpDownClassCard(
                      name: '张三',
                      role: '游泳教练',
                      left: 22.w,
                      bottom: 22.h,
                    )
                  : Container(),
              childrenIsSign
                  ? UpDownClassCard(
                      name: '李四',
                      role: '学生',
                      right: 22.w,
                      bottom: 22.h,
                    )
                  : Container()
              // _businState == BusinState.upDownClass
            ],
          ),
        ),
      ),
    );
  }
}
