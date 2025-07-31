import '../../domain/entities/blog_like_entity.dart';

class BlogLikeModel extends BlogLikeEntity {
  BlogLikeModel({
    required super.id,
    required super.createdAt,
    required super.blogId,
    required super.userId,
  });

  factory BlogLikeModel.fromJson(Map<String, dynamic> json) {
    return BlogLikeModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      blogId: json['blogId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'blogId': blogId,
    'userId': userId,
  };
}
