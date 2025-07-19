import '../../../../core/entities/user_entity.dart';

class AuthResponseEntity {
  final String accessToken;
  final UserEntity user;

  AuthResponseEntity({required this.accessToken, required this.user});
}
