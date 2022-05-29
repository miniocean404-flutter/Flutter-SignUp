part of util.plugin;

Future<void> backHome() async {
  if (Platform.isAndroid) {
    AndroidIntent intent = const AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: "android.intent.category.HOME",
    );

    await intent.launch();
  }
}
