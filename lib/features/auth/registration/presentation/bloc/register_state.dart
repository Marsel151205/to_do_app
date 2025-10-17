enum RegisterStatus { initial, loading, success, failure }

class RegisterState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final String? errorMessage;

  const RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
    String? errorMessage,
    RegisterStatus? status,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage
    );
  }
}


