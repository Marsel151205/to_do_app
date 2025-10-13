import 'package:to_do_app/features/auth/registration/data/auth_service.dart';
import 'package:to_do_app/features/auth/registration/domain/models/registration_response.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository(this.authService);

  Future<RegistrationResponse> registration(
    String username,
    String email,
    String password,
    String confirmPassword,
  ) async {

    return authService.registration(username, email, password);
  }
}
