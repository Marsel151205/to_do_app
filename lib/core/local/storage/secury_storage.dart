import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuryStorageService {
  static const _accessTokenKey = 'acccess_token';
  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock
    ),
  );

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken)
    ]);
  }

  Future<String?> getAccessToken() async => await _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() async => await _storage.read(key: _refreshTokenKey);

  Future<void> deleteTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey)
    ]);
  }

  Future<bool> hasTokens() async {
    final accessToken = await getAccessToken();
    return accessToken != null;
  }
}