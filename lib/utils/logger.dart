import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, //展示方法调用数
    errorMethodCount: 8,
    lineLength: 120,
    colors: true, // 彩色日志消息
    printEmojis: true, // 为每条日志消息打印一个表情符号
    printTime: false, // 每个日志打印是否应包含时间戳
  ),
);

logV(dynamic msg) {
  _logger.v(msg);
}

logD(dynamic msg) {
  _logger.d(msg);
}

logI(dynamic msg) {
  _logger.i(msg);
}

logW(dynamic msg) {
  _logger.w(msg);
}

logE(dynamic msg) {
  _logger.e(msg);
}

logWTF(dynamic msg) {
  _logger.wtf(msg);
}
