import '../../domain/entities/feed_comment_entity.dart';

class FeedCommentModel extends FeedCommentEntity {
  const FeedCommentModel({
    required super.id,
    required super.feedId,
    required super.userId,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FeedCommentModel.fromJson(Map<String, dynamic> json) {
    return FeedCommentModel(
      id: json['id'] as String,
      feedId: json['feedId'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String,
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
