import 'package:flutter_sign_in/config/env/abstract_current_env.dart';

class EnvironmentProd extends CurrentEnv {
  EnvironmentProd() {
    baseUrl = 'http://192.168.1.130:4040';
  }
}
