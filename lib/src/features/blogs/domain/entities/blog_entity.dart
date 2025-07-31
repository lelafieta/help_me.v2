import 'package:utueji/src/features/blogs/domain/entities/blog_comment_entity.dart';
import 'package:utueji/src/features/blogs/domain/entities/blog_like_entity.dart';
import 'package:utueji/src/features/blogs/domain/entities/blog_share_entity.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../ongs/domain/entities/ong_entity.dart';

class BlogEntity {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String title;
  final String description;
  final String userId;
  final String ongId;
  final String? image;
  final UserEntity? user;
  final OngEntity? ong;
  final List<BlogCommentEntity> comments;
  final List<BlogShareEntity> shares;
  final List<BlogLikeEntity> likes;

  BlogEntity({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.title,
    required this.description,
    required this.userId,
    required this.ongId,
    this.image,
    this.user,
    this.ong,
    required this.comments,
    required this.likes,
    required this.shares,
  });
}
