import '../../domain/entities/community_entity.dart';
import '../../domain/entities/community_member_entity.dart';
import 'community_member_model.dart';

class CommunityModel extends CommunityEntity {
  CommunityModel({
    required super.id,
    required super.name,
    required super.description,
    required super.location,
    super.imageUrl,
    required super.createdAt,
    required super.updatedAt,
    required super.ownerId,
    required super.members,
    required super.membersCount,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      ownerId: json['ownerId'],
      members: (json['members'] as List)
          .map((m) => CommunityMemberModel.fromJson(m))
          .toList(),
      membersCount: json['_count']?['members'] ?? 0,
    );
  }
}
