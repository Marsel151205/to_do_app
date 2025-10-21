import 'package:to_do_app/features/auth/registration/domain/models/registration_response.dart';

abstract class RegisterState {
  const RegisterState();
}

class Action extends RegisterState {
  final String name;
  final String email;
  final String password;
  
  const Action(this.name, this.email, this.password);
}

class Success extends RegisterState {
  final RegistrationResponse response;

  const Success(this.response);
}

class Error extends RegisterState {
  final String errorMessage;

  const Error(this.errorMessage);
}

class Loading extends RegisterState {
  const Loading();

}