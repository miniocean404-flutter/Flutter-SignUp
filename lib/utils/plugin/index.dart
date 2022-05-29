library util.plugin;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sign_in/router/routers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:logger/logger.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:pointycastle/asymmetric/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

// 所有 part 属于 util.plugin 这些 part 共享所有变量
part 'android_intent.dart';
part 'device_info.dart';
part 'file.dart';
part 'ip.dart';
part 'local_auth.dart';
part 'local_notifications.dart';
part 'logger.dart';
part 'rsa.dart';
part 'shared_preferences.dart';
part 'toast.dart';
part 'url_launcher.dart';
part 'url_scheme.dart';
