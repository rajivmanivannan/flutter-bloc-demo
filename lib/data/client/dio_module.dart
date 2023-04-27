
import 'package:dio/dio.dart';

class DioModule {
  final dio = createDio();
  DioModule._internal();
  static final _singleton = DioModule._internal();
  factory DioModule() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://api.github.com",
    ));
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        request: false,
      ),
    );
    return dio;
  }
}