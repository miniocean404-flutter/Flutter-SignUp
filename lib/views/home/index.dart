import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/qr_scanner.dart';
import 'package:flutter_sign_in/components/busin/up_down_class_card.dart';
import 'package:flutter_sign_in/components/common/modal.dart';
import 'package:flutter_sign_in/http/login.dart';
import 'package:flutter_sign_in/http/qr_code.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:flutter_sign_in/utils/plugin/logger.dart';
import 'package:flutter_sign_in/utils/plugin/shared_preferences.dart';
import 'package:flutter_sign_in/utils/plugin/toast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

enum BusinState {
  sign,
  upDownClass,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with RouteAware {
  late VideoPlayerController _videoController; // 播放控制器
  String videoLink = 'https://davinciwebresources.blob.core.windows.net/davinci-web-resources/last dance.mp4';

  MobileScannerController _scanController = MobileScannerController(
    // 相机朝向
    facing: CameraFacing.front,
    torchEnabled: false,
  );

  int _clickNum = 0; // 点击跳转次数

  DateTime? _scanLastTime; // 距离上次扫码时间
  DateTime? _backLastTime; // 安卓返回桌面的时间间隔

  StateType _modalState = StateType.none; // 弹窗状态
  final BusinState _businState = BusinState.sign; // 当前业务模式

  bool teachIsSign = false; // 老师是否签到
  bool childrenIsSign = false; // 学生是否签到
  bool isHavaVideoLink = true; // 是否有视频链接

  // 初始化声明周期
  @override
  void initState() {
    super.initState();
    login();
    initVideo(videoLink);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 监听路由变化 需要 material 注册 需要 with RouteAware
    if (ModalRoute.of(context) != null) {
      Routers.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  // 页面栈弹出声明周期
  @override
  void deactivate() {
    // isCurrent:这条路线是否是导航器上最顶层的路线
    dynamic isBack = ModalRoute.of(context)?.isCurrent;

    if (isBack) {
      // 限于从其他页面返回到当前页面时执行，首次进入当前页面不执行
      // 注：此方法在iOS手势返回时，不执行此处
      debugPrint('从其他页面返回到${widget.runtimeType}页');
    } else {
      // 离开当前页面或退出当前页面时执行
      debugPrint('离开或退出${widget.runtimeType}页');
    }

    super.deactivate();
  }

  // 页面彻底销毁声明周期
  @override
  void dispose() {
    _videoController.dispose();

    Routers.routeObserver.unsubscribe(this);

    Wakelock.toggle(enable: false);

    super.dispose();
  }

  @override
  // 别的页面进来的时候调用
  void didPush() {
    // 获取当前页面的名字
    // ignore: unused_local_variable
    final route = ModalRoute.of(context)?.settings.name;
  }

  @override
  // 别的页面退出到当前页面的时候调用
  void didPopNext() {
    _scanController = MobileScannerController(
      // 相机朝向
      facing: CameraFacing.front,
      torchEnabled: false,
    );

    setState(() {});
  }

  @override
  // 当前页面去别的页面时候调用
  void didPushNext() {
    _scanController.dispose();

    logger.i(_scanController);
  }

  @override
  // 当前页面pop的时候嗲用
  void didPop() {}

  void login() async {
    final res = await deviceLogin(187237, 'f1c8ec723723');
    await SpHelper.setLocalStorage('token', res['accessSecret']);
  }

  // 初始化视频
  initVideo(url) async {
    _videoController = VideoPlayerController.network(url);

    _videoController.addListener(() {
      final message = _videoController.value.errorDescription;
      if (message != null) logger.e(message);
    });

    await _videoController.setLooping(true);
    if (kIsWeb) {
      // play() failed because the user didn't interact with the document
      // chrome文档 https://developer.chrome.com/blog/autoplay/
      // web必须和用户有交互(包括点击等)才可以进行播放，防止打扰用户，如果需要自动播放需要将声音设置为0
      await _videoController.setVolume(0.0);
    }

    await _videoController.setVolume(0.0);
    await _videoController.play();
    await _videoController.initialize();

    Wakelock.toggle(enable: true);
    setState(() {});
    // 设置属性后初始化
  }

  // 扫码结果
  scanQRcode(Barcode barcode, MobileScannerArguments? args) async {
    final String? code = barcode.rawValue;
    final String token = SpHelper.getLocalStorage('token');
    String? mode;

    DateTime now = DateTime.now();
    bool gap = _scanLastTime == null || now.difference(_scanLastTime!).inSeconds > 1;

    if (gap && code != null) {
      _scanLastTime = DateTime.now();

      _businState == BusinState.sign ? mode = 'admittance' : mode = 'serviceSigning';

      dynamic res = await scanQRCodeApi(token, code, mode);
      bool isSuccess = res['isSuccess'];
      String message = res['message'];
      int delayClose = res['delayClose'];
      String? textColor = res['appUseInfo']['textColor'];
      String? backgroundUrl = res['appUseInfo']['backgroundUrl'];

      if (backgroundUrl != null) {
        initVideo(backgroundUrl);
      }
    }
  }

  // 关闭弹窗
  closeModal() {
    setState(() => {_modalState = StateType.none});
  }

  // 进入设置界面
  goSetting() {
    _clickNum++;

    if (_clickNum > 5 && _clickNum < 10) {
      toast('再点击5次进入设置界面');
    }

    if (_clickNum >= 10) {
      _clickNum = 0;

      _scanController.dispose();
      Routers.navigateTo(context, Routers.settingHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = _businState == BusinState.sign ? '签到' : '上下课';
    bool isShowVideo = _businState == BusinState.sign && _videoController.value.isInitialized;
    dynamic isBack = ModalRoute.of(context)?.isCurrent;

    return WillPopScope(
      onWillPop: !kIsWeb && Platform.isIOS
          // 处理 iOS 手势返回的问题，并且不能清理路由栈信息
          ? null
          : () async {
              DateTime now = DateTime.now();

              // 对比两个时间是否相差1秒
              if (_backLastTime == null || now.difference(_backLastTime!).inSeconds > 1) {
                _backLastTime = DateTime.now();
                toast('再点击一次回桌面');
                return false;
              } else {
                return true;
              }
            },
      child: CupertinoPageScaffold(
        child: Center(
          child: StateModal(
            state: _modalState,
            onClose: closeModal,
            bgChild: Stack(
              alignment: Alignment.center,
              children: [
                // 背景视频
                isShowVideo
                    ? Transform.scale(
                        // 将宽度保持与设备宽度一致的最大放大数值 设备宽度可使用：window.physicalSize.aspectRatio || MediaQuery.of(context).size.aspectRatio
                        scale: _videoController.value.aspectRatio / window.physicalSize.aspectRatio,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                      )
                    : Container(),

                Column(
                  children: [
                    SizedBox(height: 159.h),

                    // 签到标题
                    GestureDetector(
                      onTap: goSetting,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 29.sp,
                          fontWeight: FontWeight.w600,
                          color: isHavaVideoLink ? const Color(0xffFFFFFF) : const Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 102.h),

                    // 扫码
                    isBack == true
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 160.r,
                              height: 160.r,
                              child: QRScanner(
                                controller: _scanController,
                                onDetect: scanQRcode,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 158.h),

                    // 老师或者学生签到后不显示
                    teachIsSign || childrenIsSign
                        ? Container()
                        : Column(
                            children: [
                              Text(
                                '请向屏幕展示二维码',
                                style: TextStyle(
                                  color: isHavaVideoLink ? const Color(0xffFFFFFF) : const Color(0xff999999),
                                  fontSize: 14.5.sp,
                                ),
                              ),
                              Text(
                                '识别后会自动签到',
                                style: TextStyle(
                                  color: isHavaVideoLink ? const Color(0xffFFFFFF) : const Color(0xff999999),
                                ),
                              ),
                              SizedBox(height: 292.h),
                              Text(
                                'Serendipity Envoy',
                                style: TextStyle(
                                  color: isHavaVideoLink ? const Color(0xffFFFFFF) : const Color(0xffCECECE),
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
      ),
    );
  }
}
