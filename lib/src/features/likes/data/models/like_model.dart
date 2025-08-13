import '../../domain/entities/like_entity.dart';

class LikeModel extends LikeEntity {
  const LikeModel({
    required super.id,
    required super.userId,
    required super.createdAt,
    super.postId,
    super.blogId,
    super.feedId,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      postId: json['postId'],
      blogId: json['blogId'],
      feedId: json['feedId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'postId': postId,
      'blogId': blogId,
      'feedId': feedId,
    };
  }
}
