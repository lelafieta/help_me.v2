import '../../../auth/domain/entities/user_entity.dart';

class CommunityMemberEntity {
  final String id;
  final String role;
  final DateTime joinedAt;
  final String userId;
  final String communityId;
  final UserEntity user;

  const CommunityMemberEntity({
    required this.id,
    required this.role,
    required this.joinedAt,
    required this.userId,
    required this.communityId,
    required this.user,
  });
}
