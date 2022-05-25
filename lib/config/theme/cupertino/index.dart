import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/theme/cupertino/dark.dart';
import 'package:flutter_sign_in/config/theme/cupertino/light.dart';

CupertinoThemeData cupertinoTheme(isDarkMode) {
  return isDarkMode ? cupertinoDarkTheme : cupertinoLightTheme;
}
