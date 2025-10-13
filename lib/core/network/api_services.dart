import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices(this.dio);

  Future<Response> get(String path, {Map<String, dynamic>? query}) async => dio.get(path, queryParameters: query);

  Future<Response> post(String path, {dynamic, data}) async => dio.post(path, data: data);
}