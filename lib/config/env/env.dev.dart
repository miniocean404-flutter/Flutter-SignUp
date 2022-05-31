import 'package:flutter/foundation.dart';
import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/constant/index.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';

class EnvironmentDev extends CurrentEnv {
  EnvironmentDev(channel) {
    this.channel = channel;

    final getUrl = SpHelper.getLocalStorage('baseUrl');

    if (!kIsWeb) {
      baseUrl = DOMAIN_DEV_BASE_URL; // 服务器
    }

    if (kIsWeb) {
      // baseUrl = IP_COMPANY_DEV_BASE_URL; // 公司
      baseUrl = ip_HOME_DEV_BASE_URL; // 自己
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
