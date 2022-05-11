import 'package:flutter_sign_in/config/env/abstract_current_env.dart';
import 'package:flutter_sign_in/utils/shared_preferences.dart';

class EnvironmentDev extends CurrentEnv {
  EnvironmentDev() {
    baseUrl = 'http://10.30.13.134:4040';
    SpHelper.setLocalStorage('baseUrl', baseUrl);
  }
}
