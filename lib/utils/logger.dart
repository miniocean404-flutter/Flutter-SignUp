// https://juejin.cn/post/6963128547837739015

import 'package:logger/logger.dart';

var logger = Logger(
  filter: DevelopmentFilter(), // 默认开发环境，如果是prod则生产开发都会打印日志
  output: ConsoleOutput(), // 输出位置，默认是控制台:可以是控制台、文件、内存
  printer: PrettyPrinter(
    stackTraceBeginIndex: 5, // 方法栈的开始下标,默认 0
    methodCount: 1, //展示方法调用数，默认 2
    errorMethodCount: 8, // 自己传入方法栈对象后该参数有效
    lineLength: 120, // 每行最多打印的字符个数
    colors: true, // 彩色日志消息
    printEmojis: true, // 为每条日志消息打印一个表情符号
    printTime: false, // 每个日志打印是否应包含时间戳
  ),
);
