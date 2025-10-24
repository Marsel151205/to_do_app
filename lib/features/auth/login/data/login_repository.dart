import 'package:to_do_app/core/local/storage/secury_storage.dart';
import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/login/domain/models/login_response.dart';

class LoginRepository {
  final ApiServices api;
  final SecuryStorageService _storage;
  LoginRepository(this.api, this._storage);

  Future<LoginResponse> login(String username, String password) async {
    final response = await api.post(
      '/api/auth/login',
      data: {'username': username, 'password': password},
    );

    final data = response.data;

    _storage.saveTokens(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );

    return LoginResponse(
      data['userName'],
      data['accessToken'],
      data['refreshToken'],
    );
  }
}
