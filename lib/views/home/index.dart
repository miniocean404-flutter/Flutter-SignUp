import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/components/busin/qr_scanner.dart';
import 'package:flutter_sign_in/components/busin/sign_state_modal.dart';
import 'package:flutter_sign_in/components/busin/up_down_class_card.dart';
import 'package:flutter_sign_in/components/common/video_full.dart';
import 'package:flutter_sign_in/http/api/login.dart';
import 'package:flutter_sign_in/http/api/qr_code.dart';
import 'package:flutter_sign_in/router/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';
import 'package:flutter_sign_in/utils/system/index.dart';
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

class _HomeState extends State<Home> with RouteAware, WidgetsBindingObserver {
  late VideoPlayerController _videoController; // 播放控制器
  String videoLink = 'https://davinciwebresources.blob.core.windows.net/davinci-web-resources/last dance.mp4';

  late MobileScannerController _scanController;

  bool isShowScan = false;

  int _clickNum = 0; // 点击跳转次数

  DateTime? _scanLastTime; // 距离上次扫码时间
  DateTime? _backLastTime; // 安卓返回桌面的时间间隔

  final BusinState _businState = BusinState.sign; // 当前业务模式

  bool teachIsSign = false; // 老师是否签到
  bool childrenIsSign = false; // 学生是否签到
  bool isHavaVideoLink = true; // 是否有视频链接

  // 初始化声明周期
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    login();
    initVideo(videoLink);
    startScanQrAndVideo(true);
  }

  // 页面彻底销毁
  @override
  void dispose() {
    _videoController.dispose();

    WidgetsBinding.instance.removeObserver(this);
    Routers().routeObserver.unsubscribe(this);

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 监听路由变化 需要 material 注册 需要 with RouteAware
    if (ModalRoute.of(context) != null) {
      Routers().routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  // 页面栈弹出声明周期
  @override
  void deactivate() {
    // isCurrent:这条路线是否是导航器上最顶层的路线
    dynamic isBack = ModalRoute.of(context)?.isCurrent;
    // 命令版 willPop
    // logger.i(ModalRoute.of(context)?.willPop());

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
    barWidgetShow();
    startScanQrAndVideo(true);
  }

  @override
  // 当前页面去别的页面时候调用
  void didPushNext() {
    barWidgetShow(show: 'all');
    startScanQrAndVideo(false);
  }

  @override
  // 当前页面pop的时候嗲用
  void didPop() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      // 应用可见并可响应用户操作
      case AppLifecycleState.resumed:
        // isCurrent:这条路线是否是导航器上最顶层的路线
        dynamic isBack = ModalRoute.of(context)?.isCurrent;

        if (isBack) startScanQrAndVideo(true);

        break;
      // 用户可见，但不可响应用户操作
      case AppLifecycleState.inactive:
        break;
      // 已经暂停了，用户不可见、不可操作
      case AppLifecycleState.paused:
        startScanQrAndVideo(false);
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

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

    setState(() {});
    // 设置属性后初始化
  }

  // 创建销毁扫码控制器
  void startScanQrAndVideo(bool state) async {
    if (state) {
      _scanController = MobileScannerController(
        // 相机朝上 front
        facing: CameraFacing.back,
        torchEnabled: false,
      );

      _videoController.play();

      // web 插件加载延时问题
      if (kIsWeb) {
        Timer(const Duration(milliseconds: 1000), () => Wakelock.toggle(enable: true));
      } else {
        Wakelock.toggle(enable: true);
      }
    } else {
      _scanController.dispose();
      _videoController.pause();
      await Wakelock?.toggle(enable: false);
    }
    setState(() {
      isShowScan = state;
    });
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

        // ignore: use_build_context_synchronously
        Navigator.of(context).push(Routers().showDialogRouter(const SignStateModal(state: StateType.success)));
      }
    }
  }

  // 进入设置界面
  goSetting() async {
    _clickNum++;

    if (_clickNum < 5) {
      toast('点击5次进入设置界面');
    }

    if (_clickNum >= 5 && !kIsWeb) {
      final auth = LocalAuth();
      final isCanBiometrics = await auth.isCanBiometrics;
      final isCanDeviceBiometrics = await auth.isCanDeviceBiometrics;

      if (!isCanBiometrics && !isCanDeviceBiometrics) {
        _clickNum = 0;

        // ignore: use_build_context_synchronously
        Routers().navigateTo(CustomRoute().settingHome);
      }

      if (isCanBiometrics || isCanDeviceBiometrics) {
        final bool isSucess = await auth.startCertification();
        if (isSucess == true) {
          _clickNum = 0;

          // ignore: use_build_context_synchronously
          Routers().navigateTo(CustomRoute().settingHome);
        }
      }
    } else if (_clickNum >= 5 && kIsWeb) {
      Routers().navigateTo(CustomRoute().settingHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = _businState == BusinState.sign ? '签到' : '上下课';
    bool isShowVideo = _businState == BusinState.sign && _videoController.value.isInitialized;

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
              } else if (!kIsWeb && Platform.isAndroid) {
                backHome();
                return false;
              } else {
                return true;
              }
            },
      child: CupertinoPageScaffold(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 背景视频
              VideoFull(
                show: isShowVideo,
                videoAspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),

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
                  isShowScan == true
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
    );
  }
}
