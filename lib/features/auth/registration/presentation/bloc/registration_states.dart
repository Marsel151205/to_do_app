import '../../domain/models/registration_response.dart';

abstract class RegistrationStates {}

class RegistrationLoading extends RegistrationStates {}

class RegistrationError extends RegistrationStates {
  final String errorMessage;

  RegistrationError({required this.errorMessage});
}

class RegistrationSuccess extends RegistrationStates {
  final RegistrationResponse registrationResponse;

  RegistrationSuccess({required this.registrationResponse});
}
