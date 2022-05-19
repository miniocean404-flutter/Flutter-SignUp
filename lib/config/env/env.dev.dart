import 'package:flutter/foundation.dart';
import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/utils/plugin/shared_preferences.dart';

class EnvironmentDev extends CurrentEnv {
  EnvironmentDev(channel) {
    this.channel = channel;

    final getUrl = SpHelper.getLocalStorage('baseUrl');

    if (!kIsWeb) {
      baseUrl = 'http://api.uat.serendipity.illiaccess.com'; // 服务器
    }

    if (kIsWeb) {
      // baseUrl = 'http://10.30.13.134:4040'; // 公司
      baseUrl = 'http://192.168.1.130:4040'; // 自己
    }

    RegExp reg = RegExp(r"\/\/([\d\w.]+)", multiLine: true, unicode: true);
    final getURL = reg.firstMatch(getUrl ?? '')?.group(1);
    final baseURL = reg.firstMatch(baseUrl)?.group(1);

    if (getURL != baseURL) {
      SpHelper.setLocalStorage('baseUrl', baseUrl);
    } else {
      baseUrl = getUrl;
    }
  }
}
