import '../../../auth/data/models/user_model.dart';
import '../../../ongs/data/models/ong_model.dart';
import '../../domain/entities/blog_entity.dart';
import 'blog_comment_model.dart';
import 'blog_like_model.dart';
import 'blog_share_model.dart';

class BlogModel extends BlogEntity {
  BlogModel({
    required super.id,
    required super.createdAt,
    super.updatedAt,
    required super.title,
    required super.description,
    required super.userId,
    required super.ongId,
    super.image,
    super.user,
    super.ong,
    required super.comments,
    required super.likes,
    required super.shares,
  });

  // Serializa para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'title': title,
      'description': description,
      'user_id': userId,
      'ond_id': ongId,
      'image': image,
    };
  }

  // Desserializa de JSON
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      title: json['title'],
      description: json['description'],
      userId: json['userId'],
      ongId: json['ongId'],
      image: json['image'],
      user: (json['user'] == null) ? null : UserModel.fromJson(json['user']),
      ong: (json['ong'] == null) ? null : OngModel.fromJson(json['ong']),
      comments: List<BlogCommentModel>.from(
        json['blogComments'].map((x) => BlogCommentModel.fromJson(x)),
      ),
      likes: List<BlogLikeModel>.from(
        json['blogLikes'].map((x) => BlogLikeModel.fromJson(x)),
      ),
      shares: List<BlogShareModel>.from(
        json['blogShares'].map((x) => BlogShareModel.fromJson(x)),
      ),
    );
  }
}
