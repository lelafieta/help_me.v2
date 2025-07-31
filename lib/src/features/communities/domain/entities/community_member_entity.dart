class CommunityMemberEntity {
  final String id;
  final String role;
  final DateTime joinedAt;
  final String userId;
  final String communityId;

  const CommunityMemberEntity({
    required this.id,
    required this.role,
    required this.joinedAt,
    required this.userId,
    required this.communityId,
  });
}
