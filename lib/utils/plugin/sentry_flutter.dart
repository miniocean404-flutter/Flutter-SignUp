// 创建 SentryClient 用于将异常日志上报给 sentry 平台
// 平台地址：https://sentry.io
// 文档: https://docs.sentry.io/platforms/flutter/configuration/options/#common-options
// js 文章: https://juejin.cn/post/7007607369962094599
part of util.plugin;

void sentryInit(Function runApp) {
  // 捕获并上报 Flutter 异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    // dumpErrorToConsole 将给定的异常详细信息打印到控制台。
    // 第一次调用这个函数时，它使用[debugPrint]将一个非常详细的消息转储到控制台。
    // 后续调用只转储异常的第一行，除非将forceReport设置为true(在这种情况下，它转储详细消息)。
    // 调用[resetErrorCount]可使此方法恢复到以前从未调用过的状态(因此下一条消息将再次变得冗长)。
    // [onError]处理程序的默认行为是调用这个函数。
    if (!isStartSentry) FlutterError.dumpErrorToConsole(details);

    // handleUncaughtError 处理未捕获的异步错误。
    // 这个函数处理的异步错误有两种:
    // 1. 在异步回调中抛出的未捕获错误，例如，传递给[Timer.run]的函数中的抛出。
    // 2. 通过[Future]和[Stream]链推入的异步错误，但没有为其注册错误处理程序。大多数异步类，
    //    如[Future]或[Stream]会将错误推送给它们的监听器。错误以这种方式传播，直到侦听器处理错误(例如使用[Future.catchError])，或者再也没有可用的侦听器。
    //    在后一种情况下，期货和流调用区域的[handleUncaughtError]。
    // 默认情况下，由根区域处理时，未捕获的异步错误将被视为未捕获的同步异常。
    // Zone.current.handleUncaughtError 错误会交给 runZonedGuarded 处理
    if (!isStartSentry) Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  // 捕获并上报 Dart 异常
  runZonedGuarded(
    () {
      SentryFlutter.init(
        (options) => options
          ..dsn = dsn
          // 配置错误事件的采样率，范围为0.0至1.0。默认值1.0表示发送 100% 的错误事件。如果设置为0.1仅发送 10% 的错误事件。事件是随机挑选的
          ..tracesSampleRate = 1.0
          ..environment = 'dev'
          // 开启关闭已用包的报告
          ..reportPackages = true,
        appRunner: isStartSentry ? () => runApp() : null,
      );

      !isStartSentry ? runApp() : null;
    },
    (Object exception, StackTrace stackTrace) async {
      _reportError(exception, stackTrace);
    },
  );
}

// 上报异常的函数
Future<void> _reportError(dynamic exception, dynamic stackTrace) async {
  if (!isStartSentry) debugPrint('错误信息:\r\n $exception \r\n ${!kIsWeb ? stackTrace : ''}');

  if (isStartSentry) {
    final SentryId response = await Sentry.captureException(exception, stackTrace: stackTrace);
    logger.i('Success! Event ID: ${response.toString()}');
  }
}
