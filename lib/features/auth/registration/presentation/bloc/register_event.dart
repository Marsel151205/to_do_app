abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterSubmitted(
    this.name,
    this.email,
    this.password,
    this.confirmPassword
  );
}
