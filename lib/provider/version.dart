import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/utils/plugin/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Version extends ChangeNotifier {
  late String _version = '';
  late bool _isAutoUpdate = false;

  Version() {
    getPackageVersion();
    getIsAutoUpdateVersion();
  }

  // 设置本地版本信息
  void getPackageVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;

    // 异步设置完后更新数据
    notifyListeners();
  }

  getIsAutoUpdateVersion() async {
    final dynamic localUpdate = SpHelper.getLocalStorage('isAutoUpdate');

    if (localUpdate == null) {
      await SpHelper.setLocalStorage('isAutoUpdate', true);
      _isAutoUpdate = true;
    } else {
      _isAutoUpdate = localUpdate;
    }

    notifyListeners();
  }

  // 版本
  String? get getVersion => _version;

  set setVersion(String v) {
    _version = v;

    notifyListeners();
  }

  // 是否自动更新
  bool get getIsAutoUpdate => _isAutoUpdate;

  set setIsAutoUpdate(bool v) {
    _isAutoUpdate = v;

    notifyListeners();
  }
}
