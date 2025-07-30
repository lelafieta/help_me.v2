import '../../../auth/domain/entities/user_entity.dart';

class OngMemberEntity {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String ongId;
  final String userId;
  final UserEntity user;

  OngMemberEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.ongId,
    required this.userId,
    required this.user,
  });
}
