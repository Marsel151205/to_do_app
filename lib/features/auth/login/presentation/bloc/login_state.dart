
import 'package:to_do_app/features/auth/login/domain/models/login_response.dart';

abstract class LoginState {
  const LoginState();
}

class Input extends LoginState {
  final String username;
  final String password;

  const Input(this.username, this.password);
}

class Success extends LoginState {
  final LoginResponse response;

  Success(this.response);
}

class ErrorState extends LoginState {
  final String? errorMessage;

  ErrorState(this.errorMessage);
}

class Loading extends LoginState {
  const Loading();
}