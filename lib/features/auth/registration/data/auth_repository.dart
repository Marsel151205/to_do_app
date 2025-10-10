class AuthRepository {
  Future<bool> registration(
    String username,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return username == 'Marsel' &&
        email == 'marsel@gmail.com' &&
        password == '1324';
  }
}
