import 'package:dio/dio.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    switch (statusCode) {
      case 400:
        err = DioException(
          requestOptions: err.requestOptions,
          message: 'Неверный запрос',
          type: DioExceptionType.badResponse,
          response: err.response,
        );
        break;
      case 401:
        err = DioException(
          requestOptions: err.requestOptions,
          message: 'Требуется авторизация',
          type: DioExceptionType.badResponse,
        );
        break;
      case 403:
        err = DioException(
          requestOptions: err.requestOptions,
          message: 'Ошибка на стороне сервера',
          type: DioExceptionType.badResponse,
          response: err.response,
        );
        break;
      case 500:
        err = DioException(
          requestOptions: err.requestOptions,
          message: 'Ошибка на стороне сервера',
          type: DioExceptionType.unknown,
          response: err.response,
        );
        break;
      default:
        err = DioException(
          requestOptions: err.requestOptions,
          message: 'Неизвестная ошибка',
          type: DioExceptionType.unknown,
          response: err.response,
        );
    }
    return handler.reject(err);
  }
}
