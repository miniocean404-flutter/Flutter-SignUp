import 'package:flutter/cupertino.dart';
import 'package:flutter_sign_in/utils/plugin/index.dart';

class BusinStatus extends ChangeNotifier {
  late String _busin = '';

  BusinStatus() {
    getBusinStatus();
  }

  // 获取本地业务信息
  void getBusinStatus() async {
    final dynamic currentBusinStatus = SpHelper.getLocalStorage('busin');
    if (currentBusinStatus == null) {
      await SpHelper.setLocalStorage('busin', '签到');
      _busin = '签到';
    } else {
      _busin = currentBusinStatus;
    }

    // 异步设置完后更新数据
    notifyListeners();
  }

  // 版本
  String? get getBusin => _busin;

  set setBusin(String v) {
    _busin = v;

    notifyListeners();
  }
}
