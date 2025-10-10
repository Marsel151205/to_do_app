class AuthRepository {
  Future<String> registration(
    String username,
    String email,
    String password,
    String confirmPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    String answer = '';
    if (username.isEmpty) {
      answer = 'Имя пользователя некорректно';
    } else if (email.isEmpty) {
      answer = "Почта не валидна";
    } else if (password.length < 8) {
      answer = 'Длина пароль должна быть больше или равна 8';
    } else if (password != confirmPassword) {
      answer = 'Подтвердите пароль';
    }

    return answer;
  }
}
