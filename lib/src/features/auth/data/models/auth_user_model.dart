import '../../domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.avatarUrl,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
    );
  }
}
