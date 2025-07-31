import '../../../auth/domain/entities/user_entity.dart';
import '../../../ongs/domain/entities/ong_entity.dart';
import 'feed_comment_entity.dart';
import 'feed_like_entity.dart';
import 'feed_view_entity.dart';

class FeedEntity {
  final String? id;
  final DateTime? createdAt;
  final String? userId;
  final String? ongId;
  final String? image;
  final String? description;
  final UserEntity? user;
  final OngEntity? ong;
  final List<FeedLikeEntity> likes;
  final List<FeedCommentEntity> comments;
  final List<FeedViewEntity> views;

  FeedEntity({
    this.id,
    this.createdAt,
    this.userId,
    this.ongId,
    this.image,
    this.description,
    this.user,
    this.ong,
    required this.likes,
    required this.comments,
    required this.views,
  });
}
