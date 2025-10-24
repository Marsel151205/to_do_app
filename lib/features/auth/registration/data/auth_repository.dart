import 'package:to_do_app/core/local/storage/secury_storage.dart';
import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/registration/domain/models/registration_response.dart';

class AuthRepository {
  final ApiServices api;
  final SecuryStorageService _storage;
  AuthRepository(this.api, this._storage);
  
  Future<RegistrationResponse> registration(
    String username,
    String email,
    String password,
  ) async {
    final response = await api.post(
      '/api/auth/register',
      data: {'username': username, 'email': email, 'password': password},
    );

    final data = response.data;

     _storage.saveTokens(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );

    return RegistrationResponse(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }
}
