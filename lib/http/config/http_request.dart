import 'package:dio/dio.dart';
import './http_options.dart';
import './http_interceptor.dart';

// http 请求单例类
class Http {
  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory Http() => _instance;
  // 初始化一个单例实例
  static final Http _instance = Http._internal();
  // dio 实例
  late Dio dio;

  // 内部构造方法
  Http._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpOptions.BASE_URL,
      connectTimeout: HttpOptions.CONNECT_TIMEOUT,
      receiveTimeout: HttpOptions.RECEIVE_TIMEOUT,
      headers: HttpOptions.HEADER,
      responseType: HttpOptions.RESPONSE_TYPE,
    );

    dio = new Dio(baseOptions);
    dio.interceptors.add(HttpInterceptor()); // 添加拦截器
  }

  //* 初始化公共属性 如果需要覆盖原配置项 就调用它
  // [baseUrl] 地址前缀
  // [connectTimeout] 连接超时赶时间
  // [receiveTimeout] 接收超时赶时间
  // [headers] 请求头
  // [interceptors] 基础拦截器
  void init({
    required String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = connectTimeout!;
    dio.options.receiveTimeout = receiveTimeout!;
    dio.options.headers = headers;
    if (interceptors!.isNotEmpty) {
      dio.interceptors..addAll(interceptors);
    }
  }

  //* 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求
   * 当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  CancelToken _cancelToken = new CancelToken();
  void cancelRequests({required CancelToken token}) {
    _cancelToken.cancel("cancelled");
  }

  // * 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
    String _token = '';
    if (_token.isNotEmpty) {
      requestOptions.headers!['token'] = _token;
    }
    return requestOptions;
  }

  //* restful get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(Options());

    Response response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  //* restful post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(Options());

    Response response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  //* restful post form 表单提交操作
  Future postForm(
    String path, {
    required Map<String, dynamic> params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(Options());

    Response response = await dio.post(
      path,
      data: FormData.fromMap(params),
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  // * 下载文件
  downLoadFile(
    path,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    data,
    Options? options,
  }) async {
    Response? response = await dio.download(
      path,
      savePath,
      onReceiveProgress: (int count, int total) {
        print('$count $total');
      },
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      data: data,
      options: options,
    );
    return response;
  }
}
