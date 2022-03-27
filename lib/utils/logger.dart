import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, //展示方法调用数
    errorMethodCount: 8,
    lineLength: 120,
    colors: true, // 彩色日志消息
    printEmojis: true, // 为每条日志消息打印一个表情符号
    printTime: false, // 每个日志打印是否应包含时间戳
  ),
);
