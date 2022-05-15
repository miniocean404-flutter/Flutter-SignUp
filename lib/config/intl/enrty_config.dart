import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sign_in/generated/l10n.dart';

// 默认widget是英文的，添加 flutter_localizations 让其国际化
final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  // 为Material 组件库提供的本地化的字符串和其他值
  GlobalMaterialLocalizations.delegate,
  // 对应的Cupertino风格
  GlobalCupertinoLocalizations.delegate,
  // 定义组件默认的文本方向，从左到右或从右到左，这是因为有些语言的阅读习惯并不是从左到右，比如如阿拉伯语就是从右向左的
  GlobalWidgetsLocalizations.delegate,

  // 使用 intl 插件 根据arb自动生成(arb文件全称Application Resource Bundle，表示应用资源包)
  // generated是自动生成的dart代码,I10n是对应的arb文件目录
  // widget 中使用 S.of(context).title
  // arb 传递参数 { "title": "hello {name}"} 使用: S.of(context).title('参数')

  // 使用 VScode cli: ctrl + shift + p -> intl -> initalize 初始化 ctrl + shift + p -> intl -> Add local 添加local
  S.delegate
];

// 使用intl插件生成的
final supportedLocales = S.delegate.supportedLocales;

// 监听系统语言切换事件，一些安卓零碎个性，可设置多语言列表，默认以第一个列表为默认语言
Locale localeListResolutionCallback(
  List<Locale>? locales,
  Iterable<Locale> supportedLocales,
) {
  if (locales != null) {
    return locales.first;
  }

  return const Locale('zh', 'CN');
}

// 监听系统语言切换事件
Locale localeResolutionCallback(
  Locale? locale,
  Iterable<Locale> supportedLocales,
) {
  if (locale != null) {
    return locale;
  }

  return const Locale('zh', 'CN');
}
