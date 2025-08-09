import '../../../auth/data/models/user_model.dart';
import '../../domain/entities/feed_comment_entity.dart';

class FeedCommentModel extends FeedCommentEntity {
  const FeedCommentModel({
    required super.id,
    required super.description,
    required super.userId,
    required super.feedId,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
  });

  factory FeedCommentModel.fromJson(Map<String, dynamic> json) {
    return FeedCommentModel(
      id: json['id'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
      feedId: json['feedId'] as String,
      user: UserModel.fromJson(json['user']),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
