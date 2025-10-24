import 'package:dio/dio.dart';
import 'package:to_do_app/core/local/storage/secury_storage.dart';
import 'package:to_do_app/core/network/interceptors/auth_interceptor.dart';
import 'package:to_do_app/core/network/interceptors/error_interceptor.dart';

class ApiServices {
  Dio implDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://boxy-jxyk.onrender.com/',
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      ErrorInterceptor(),
      AuthInterceptor(SecuryStorageService()),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
      ),
    ]);

    return dio;
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async =>
      implDio().get(path, queryParameters: query);

  Future<Response> post(String path, {dynamic, data}) async =>
      implDio().post(path, data: data);
}
