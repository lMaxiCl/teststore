import 'package:dio/dio.dart';

class NetworkManager {
  final Dio _dio = Dio();
  get dio => _dio;
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() {
    return _instance;
  }
  NetworkManager._internal() {
    _dio.options.baseUrl = 'https://fakestoreapi.com';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        //add token, etc
        return handler.next(options);
      },
      onResponse: (
        Response response,
        ResponseInterceptorHandler handler,
      ) {
        //log response, etc
        return handler.next(response);
      },
      onError: (
        DioException e,
        ErrorInterceptorHandler handler,
      ) {
        //handle errors, token refresh, etc
        return handler.next(e);
      },
    ));
  }
}
