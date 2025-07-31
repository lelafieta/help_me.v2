import '../../domain/entities/community_member_entity.dart';

class CommunityMemberModel extends CommunityMemberEntity {
  CommunityMemberModel({
    required super.id,
    required super.role,
    required super.joinedAt,
    required super.userId,
    required super.communityId,
  });

  factory CommunityMemberModel.fromJson(Map<String, dynamic> json) {
    return CommunityMemberModel(
      id: json['id'],
      role: json['role'],
      joinedAt: DateTime.parse(json['joinedAt']),
      userId: json['userId'],
      communityId: json['communityId'],
    );
  }
}
