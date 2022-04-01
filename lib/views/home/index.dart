import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/qr_scanner.dart';
import 'package:flutter_sign_in/components/common/modal.dart';
import 'package:flutter_sign_in/config/global.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:flutter_sign_in/utils/logger.dart';
import 'package:flutter_sign_in/utils/toast.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StateType _modalState = StateType.none;
  late VideoPlayerController _controller;
  int _clickNum = 0;

  @override
  void initState() {
    initVideo();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  initVideo() async {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    await _controller.initialize();
    setState(() {
      _controller.setLooping(false);
      _controller.play();
    });
  }

  closeModal() {
    setState(() {
      _modalState = StateType.none;
    });
  }

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
    Global.initScreen(context); // 初始化屏幕自适应工具

    return Scaffold(
      body: Center(
        child: StateModal(
          state: _modalState,
          onClose: closeModal,
          bgChild: Stack(
            alignment: Alignment.center,
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: 768 / 1024,
                      child: VideoPlayer(_controller),
                    )
                  : const Text('空'),
              Column(
                children: [
                  SizedBox(height: 159.h),
                  GestureDetector(
                    child: Text(
                      '签到',
                      style: TextStyle(
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: goSetting,
                  ),
                  SizedBox(height: 102.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 160.r,
                      height: 160.r,
                      // child: const QRScanner(),
                    ),
                  ),
                  SizedBox(height: 158.h),
                  Text(
                    '请向屏幕展示二维码',
                    style: TextStyle(
                      color: const Color(0xff999999),
                      fontSize: 14.5.sp,
                    ),
                  ),
                  const Text(
                    '识别后会自动签到',
                    style: TextStyle(color: Color(0xff999999)),
                  ),
                  SizedBox(height: 292.h),
                  const Text(
                    'Serendipity Envoy',
                    style: TextStyle(
                      color: Color(0xffCECECE),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
