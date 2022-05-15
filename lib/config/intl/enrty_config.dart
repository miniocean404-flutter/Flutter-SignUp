// https://book.flutterchina.club/chapter13/multi_languages_support.html#_13-1-1-%E7%AE%80%E4%BB%8B
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sign_in/generated/l10n.dart';

import 'custom_local_delegate.dart';

// 默认widget是英文的，添加 flutter_localizations 让其国际化
final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
  // 为Material 组件库提供的本地化的字符串和其他值
  GlobalMaterialLocalizations.delegate,
  // 对应的Cupertino风格
  GlobalCupertinoLocalizations.delegate,
  // 定义组件默认的文本方向，从左到右或从右到左，这是因为有些语言的阅读习惯并不是从左到右，比如如阿拉伯语就是从右向左的
  GlobalWidgetsLocalizations.delegate,
  // 自定义代理
  HYLocalizationsDelegate.delegate,

  // 使用 intl 插件 根据arb自动生成(arb文件全称Application Resource Bundle，表示应用资源包)
  // generated是自动生成的dart代码,I10n是对应的arb文件目录
  // widget 中使用 S.of(context).title
  // arb 传递参数 { "title": "hello {name}"} 使用: S.of(context).title('参数')

  // 使用 VScode cli: ctrl + shift + p -> intl -> initalize 初始化 ctrl + shift + p -> intl -> Add local 添加local
  S.delegate
];

// fromSubtags:
// 一些具有多种变体的语言需要的不仅仅是语言代码才能正确区分。
// 例如，完全区分中文的所有变体需要指定语言代码、脚本代码和国家代码。这是由于简繁体文字的存在，以及在同一文字类型中书写字符的方式存在地区差异。
// 为了充分表达国家代码CN、TW和HK的每个中文变体，支持的语言环境列表应包括

final supportedLocales = [
  // generic Chinese 'zh'
  const Locale.fromSubtags(languageCode: 'zh'),
  // generic simplified Chinese 'zh_Hans'
  const Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hans',
  ),
  // generic traditional Chinese 'zh_Hant'
  const Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
  ),
  // 'zh_Hans_CN'
  const Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hans',
    countryCode: 'CN',
  ),
  // 'zh_Hant_TW'
  const Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
    countryCode: 'TW',
  ),
  // 'zh_Hant_HK'
  const Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
    countryCode: 'HK',
  ),
  const Locale('en', 'US'), // 美国英语
  const Locale('zh', 'CN'), // 中文简体
];

// 可以获取应用当前设置的语言类型(区域)
// Locale myLocale = Localizations.localeOf(context)

// 监听系统语言切换事件，一些安卓零碎个性，可设置多语言列表，默认以第一个列表为默认语言
Locale localeListResolutionCallback(
    List<Locale>? locales, Iterable<Locale> supportedLocales) {
  return const Locale('zh', 'CN');
}

// 监听系统语言切换事件
Locale localeResolutionCallback(
    Locale? locale, Iterable<Locale> supportedLocales) {
  return const Locale('zh', 'CN');
}
