import 'package:json_annotation/json_annotation.dart';

class RegistrationResponse {
  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  const RegistrationResponse({this.accessToken, this.refreshToken});
}
