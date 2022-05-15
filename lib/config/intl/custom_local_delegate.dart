// https://blog.csdn.net/zhongad007/article/details/106470787/
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// *自定义local语言配置
class HYLocalizations {
  final Locale locale;

  HYLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {"title": "home", "greet": "hello~", "picktime": "Pick a Time"},
    "zh": {"title": "首页", "greet": "你好~", "picktime": "选择一个时间"}
  };

  // 异步加载 i18n 来自服务器或者json
  Future<bool> loadJson() async {
    // 1.加载json文件
    String jsonString = await rootBundle.loadString("assets/json/i18n.json");

    // 2.转成map类型
    final Map<String, dynamic> map = json.decode(jsonString);

    // 3.注意：这里是将Map<String, dynamic>转成Map<String, Map<String, String>>类型
    _localizedValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
    return true;
  }

  String? get title {
    return _localizedValues[locale.languageCode]!["title"];
  }

  String? get greet {
    return _localizedValues[locale.languageCode]!["greet"];
  }

  String? get pickTime {
    return _localizedValues[locale.languageCode]!["picktime"];
  }
}

// * 自定义 Delegate 代理
// 我们可以像Flutter Widget中的国际化方式一样对它们进行初始化；
// 也就是我们也定义一个对象的 Delegate 类，并且将其传入 localizationsDelegates 中；
// Delegate 的作用就是当 Locale 发生改变时，调用对应的 load 方法，重新加载新的Locale资源；
// HYLocalizationsDelegate 需要继承自 LocalizationsDelegate，并且有三个方法必须重写：

// isSupported：用于当前环境的Locale，是否在我们支持的语言范围

// shouldReload：当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
// 一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次Localizations重新build时都加载一遍；
// 所以一般情况下返回false即可；

// load方法：当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
// 这个方法返回的是一个Future，因为有可能是异步加载的；
// 但是我们这里是直接定义的一个Map，因此可以直接返回一个同步的
class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<HYLocalizations> old) {
    return false;
  }

  @override
  Future<HYLocalizations> load(Locale locale) async {
    final localization = HYLocalizations(locale);
    // await localization.loadJson(); // 加载异步数据i18n
    Future<HYLocalizations> synchronousFuture = SynchronousFuture(localization);

    return synchronousFuture;
  }

  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();
}

// * 使用本地化格式化后的类，在 widget 中可以使用下面代码进行使用
// Localizations.of(context, HYLocalizations).title
