import 'community_member_entity.dart';

class CommunityEntity {
  final String id;
  final String name;
  final String description;
  final String location;
  String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String ownerId;
  final List<CommunityMemberEntity> members;
  final int membersCount;

  CommunityEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.ownerId,
    required this.members,
    required this.membersCount,
  });
}
