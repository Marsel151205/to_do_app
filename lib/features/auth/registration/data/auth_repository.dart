import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/registration/domain/models/registration_response.dart';

class AuthRepository {
  final ApiServices api;
  AuthRepository(this.api);

  Future<RegistrationResponse> registration(
    String username,
    String email,
    String password
  ) async {

    return registrationService(username, email, password);
  }

  
  Future<RegistrationResponse> registrationService(
    String username,
    String email,
    String password,
  ) async {
    final response = await api.post(
      '/api/auth/register',
      data: {'username': username, 'email': email, 'password': password},
    );

    final data = response.data;

    return RegistrationResponse(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }
}
