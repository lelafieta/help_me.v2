import '../../../../core/models/user_model.dart';
import '../../domain/entities/auth_response_entity.dart';
import 'auth_user_model.dart';

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({
    required super.accessToken,
    required AuthUserModel super.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
      user: AuthUserModel.fromJson(json['user']),
    );
  }
}
