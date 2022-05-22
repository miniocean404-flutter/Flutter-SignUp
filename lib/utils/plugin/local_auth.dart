// 指纹识别 面部识别

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign_in/utils/plugin/logger.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  // 初始化一个单例实例
  static final LocalAuth _instance = LocalAuth._internal();
  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory LocalAuth() => _instance;

  late LocalAuthentication auth;

  // 内部构造方法
  LocalAuth._internal() {
    auth = LocalAuthentication();
  }

  /// canCheckBiometrics 是否生物识别支持
  Future<bool> get isCanBiometrics async => await auth.canCheckBiometrics;

  /// isDeviceSupported 仅仅是设备级身份验证
  Future<bool> get isCanDeviceBiometrics async => await auth.isDeviceSupported();

  /// 机器是否注册了生物识别
  Future<bool> get isRegisteredBiometrics async => (await biometricsList).isNotEmpty;

  /// 获取注册的生物识别的列表
  Future<List<BiometricType>> get biometricsList async => await auth.getAvailableBiometrics();

  Future<bool> startCertification() async {
    if (kIsWeb) return false;

    // 都不支持
    if (!(await isCanBiometrics) && !await isCanDeviceBiometrics) return false;
    // 如果没有注册生物识别，有可能支持设备的锁屏密码(密码、图案、混合密码等)
    // if (await isRegisteredBiometrics) return false;

    bool authResult = false;

    final list = await biometricsList;

    if (Platform.isIOS) {
      if (list.contains(BiometricType.face)) {
        // Face ID 人脸识别.
      } else if (list.contains(BiometricType.fingerprint)) {
        // Touch ID 指纹识别.
      }
    }

    try {
      authResult = await auth.authenticate(
          localizedReason: '请认证以确认您的身份',
          options: const AuthenticationOptions(
            // 是否只用身份处理不能用密码,允许回退到 pin、模式或密码（不加不是生物识别）
            biometricOnly: false,
            // 是否使用默认对话框(在没有注册时,让其注册的,false则返回一个错误)
            useErrorDialogs: true,

            /// 如果去后台在返回还能继续识别
            stickyAuth: true,
            // 解锁以后还能干什么东西来着
            sensitiveTransaction: true,
            //
          ),
          // 自定义对话框中的消息
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'App需要您的同意,识别后才可使用设置界面',
              cancelButton: '取消',
              goToSettingsButton: '长按传感器进行识别',
              goToSettingsDescription: '请设置指纹.',
              biometricHint: "生物识别提示",
              biometricNotRecognized: "认证失败",
              biometricRequiredTitle: "弹出提示框的时候的提示",
              biometricSuccess: "认证成功",
              deviceCredentialsRequiredTitle: "您尚未在其设备上设置生物识别认证",
              deviceCredentialsSetupDescription: "需要您在设备上进行设置生物识别认证",
            ),
            IOSAuthMessages(
              lockOut: '您需要重新设置识别',
              cancelButton: '取消',
              goToSettingsButton: '点击跳转设置生物识别',
              goToSettingsDescription: '需要您在设备上进行设置生物识别认证',
              localizedFallbackTitle: '您可取消',
            ),
          ]);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // 硬件不支持处理
      } else if (e.code == auth_error.notEnrolled) {
        // 硬件不支持处理
      } else if (e.code == auth_error.lockedOut || e.code == auth_error.permanentlyLockedOut) {
        // 错误太多被锁
      } else {
        // ...
      }

      logger.e('生物识别错误: $e');
    }

    return authResult;
  }
}
