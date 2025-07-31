import '../../domain/entities/blog_share_entity.dart';

class BlogShareModel extends BlogShareEntity {
  BlogShareModel({
    required super.id,
    required super.createdAt,
    required super.blogId,
    required super.userId,
  });

  factory BlogShareModel.fromJson(Map<String, dynamic> json) {
    return BlogShareModel(
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
