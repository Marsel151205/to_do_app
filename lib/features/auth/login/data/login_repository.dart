import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/login/domain/models/login_response.dart';

class LoginRepository {
  final ApiServices api;
  LoginRepository(this.api);

  Future<LoginResponse> login(String username, String password) async {
    final response = await api.post(
      '/api/auth/login',
      data: {'username': username, 'password': password},
    );

    final data = response.data;

    return LoginResponse(
      data['userName'],
      data['accessToken'],
      data['refreshToken'],
    );
  }
}
