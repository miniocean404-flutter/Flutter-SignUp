import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/config/theme/color/dark.dart';

final CupertinoThemeData cupertinoDarkTheme = cupertinoDark();

CupertinoThemeData cupertinoDark() {
  return CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorDark.page,
    // barBackgroundColor: CupertinoColors.systemGrey6,
    primaryColor: AppColorDark.primary,
    primaryContrastingColor: AppColorDark.primary,
    textTheme: const CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemGrey,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      // actionTextStyle:,
      // tabLabelTextStyle:,
      // navTitleTextStyle:,
      // navLargeTitleTextStyle:,
      // navActionTextStyle:,
      // pickerTextStyle:,
      // dateTimePickerTextStyle:,
    ),
  );
}
