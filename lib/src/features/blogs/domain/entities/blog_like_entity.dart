class BlogLikeEntity {
  final String id;
  final DateTime createdAt;
  final String blogId;
  final String userId;

  BlogLikeEntity({
    required this.id,
    required this.createdAt,
    required this.blogId,
    required this.userId,
  });
}
