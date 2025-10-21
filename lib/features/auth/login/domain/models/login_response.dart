import 'package:json_annotation/json_annotation.dart';

class LoginResponse {
  @JsonKey(name: 'userName')
  final String? username;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  LoginResponse(this.username, this.accessToken, this.refreshToken);
}