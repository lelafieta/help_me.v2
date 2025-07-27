import 'auth_user_entity.dart';

class AuthResponseEntity {
  final String accessToken;
  final AuthUserEntity user;

  AuthResponseEntity({required this.accessToken, required this.user});
}
