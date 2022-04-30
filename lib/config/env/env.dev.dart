import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/utils/shared_preferences.dart';

class EnvironmentDev extends CurrentEnv {
  EnvironmentDev() {
    if (SpHelper.getLocalStorage('baseUrl') != null) {
      baseUrl = SpHelper.getLocalStorage('baseUrl');
    } else {
      baseUrl = 'http://192.168.1.130:4040';
    }
  }
}
