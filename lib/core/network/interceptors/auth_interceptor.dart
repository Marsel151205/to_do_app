import 'package:dio/dio.dart';
import 'package:to_do_app/core/local/storage/secury_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecuryStorageService securyStorageService;

  final refreshDio = Dio(BaseOptions(baseUrl: 'https://boxy-jxyk.onrender.com'));

  AuthInterceptor(this.securyStorageService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final publicEndpoints = ['/login', '/register', '/refresh-token'];
    if (publicEndpoints.any((endPoint) => options.path.contains(endPoint))) {
      return handler.next(options);
    }

    final accessToken = await securyStorageService.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final isRefreshed = await _refreshToken();

      if(isRefreshed) {
        try {
          final response = await _retryRequest(err.requestOptions);
          return handler.resolve(response);
        } catch(e) {
          return handler.reject(err);
        }
      } else {
        await securyStorageService.deleteTokens();

        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await securyStorageService.getRefreshToken();

      if (refreshToken == null) return false;

      final response = await refreshDio.post(
        'api/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await securyStorageService.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final accessToken = securyStorageService.getAccessToken();
    final headers = Map<String, dynamic>.from(requestOptions.headers);

    headers['Authorization'] = 'Bearer $accessToken';

    return refreshDio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        extra: requestOptions.extra
      ),
    );
  }
}
