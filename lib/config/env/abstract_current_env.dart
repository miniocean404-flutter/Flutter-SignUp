abstract class CurrentEnv {
  late String baseUrl = '';
  late String channel = '';

  // set get 只供外部使用,其他类及自身无法调用
  String get getBaseUrl => baseUrl;

  set setBaseUrl(url) => {baseUrl = url};

  String get getChannel => channel;

  set setChannel(value) => {channel = value};
}
