import '../../../auth/data/models/user_model.dart';
import '../../../resources/data/models/resource_model.dart';
import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    super.content,
    required super.createdAt,
    required super.authorId,
    super.communityId,
    super.ongId,
    required super.resources,
    required super.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      authorId: json['authorId'],
      communityId: json['communityId'],
      ongId: json['ongId'],
      user: UserModel.fromJson((json['author'])),
      resources: (json['resources'] as List)
          .map((e) => ResourceModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'authorId': authorId,
      'communityId': communityId,
      'ongId': ongId,
      // 'resources': resources.map((e) => e.toJson()).toList(),
    };
  }
}
