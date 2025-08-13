class LikeEntity {
  final String id;
  final String userId;
  final DateTime createdAt;
  final String? postId;
  final String? blogId;
  final String? feedId;

  const LikeEntity({
    required this.id,
    required this.userId,
    required this.createdAt,
    this.postId,
    this.blogId,
    this.feedId,
  });
}
