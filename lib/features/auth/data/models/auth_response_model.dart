import '../../domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({required super.accessToken, required super.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
      user: json['user'],
    );
  }
}
