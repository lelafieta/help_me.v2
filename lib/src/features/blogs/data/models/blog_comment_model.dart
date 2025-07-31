import '../../domain/entities/blog_comment_entity.dart';

class BlogCommentModel extends BlogCommentEntity {
  BlogCommentModel({
    required super.id,
    required super.content,
    required super.createdAt,
    super.updatedAt,
    required super.blogId,
    required super.userId,
  });

  factory BlogCommentModel.fromJson(Map<String, dynamic> json) {
    return BlogCommentModel(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      blogId: json['blogId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'blogId': blogId,
    'userId': userId,
  };
}
