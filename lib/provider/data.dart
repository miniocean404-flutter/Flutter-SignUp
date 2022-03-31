import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  late String data;

  String? get getColor => data;

  set setColor(String v) {
    data = v;

    notifyListeners();
  }
}
