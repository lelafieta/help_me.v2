import '../../domain/entities/feed_like_entity.dart';

class FeedLikeModel extends FeedLikeEntity {
  const FeedLikeModel({
    required super.id,
    required super.feedId,
    required super.userId,
    super.description,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FeedLikeModel.fromJson(Map<String, dynamic> json) {
    return FeedLikeModel(
      id: json['id'] as String,
      feedId: json['feedId'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String?, // pode ser null
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feedId': feedId,
      'userId': userId,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
