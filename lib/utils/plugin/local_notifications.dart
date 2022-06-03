part of util.plugin;

class LocalNotifications {
  static final LocalNotifications _instance = LocalNotifications._internal();
  factory LocalNotifications() => _instance;

  static final FlutterLocalNotificationsPlugin np = FlutterLocalNotificationsPlugin();

  LocalNotifications._internal();

  static Future<void> init() async {
    if (kIsWeb) return;

    // 设置通知图标
    AndroidInitializationSettings android = const AndroidInitializationSettings("@mipmap/ic_launcher");
    IOSInitializationSettings iOS = const IOSInitializationSettings();

    await np.initialize(InitializationSettings(android: android, iOS: iOS));
  }

  send(String title, String body) {
    if (kIsWeb) return;

    // 构建描述
    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails('id描述', '名称描述', importance: Importance.max, priority: Priority.high);
    IOSNotificationDetails iosDetails = const IOSNotificationDetails();
    NotificationDetails details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    // 显示通知, 第一个参数是id,id如果一致则会覆盖之前的通知
    np.show(DateTime.now().millisecondsSinceEpoch >> 10, title, body, details);
  }
}
