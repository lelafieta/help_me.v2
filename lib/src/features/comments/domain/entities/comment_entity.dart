import '../../../auth/domain/entities/user_entity.dart';

class CommentEntity {
  final String id;
  final String content;
  final String userId;
  final DateTime createdAt;
  final String? postId;
  final String? blogId;
  final String? feedId;
  final String? campaignId;
  final String? eventId;
  final UserEntity user;

  const CommentEntity({
    required this.id,
    required this.content,
    required this.userId,
    required this.createdAt,
    this.postId,
    this.blogId,
    this.feedId,
    this.campaignId,
    this.eventId,
    required this.user,
  });
}
