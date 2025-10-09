import 'package:json_annotation/json_annotation.dart';

class RegistrationRequest {
  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  const RegistrationRequest({this.username, this.email, this.password});
}
