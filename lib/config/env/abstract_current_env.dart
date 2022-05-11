abstract class CurrentEnv {
  late String baseUrl = '';

  // set get 只供外部使用,其他类及自身无法调用
  String get getBaseUrl => baseUrl;

  set setBaseUrl(url) => {baseUrl = url};
}
