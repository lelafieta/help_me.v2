class BlogShareEntity {
  final String id;
  final DateTime createdAt;
  final String blogId;
  final String userId;

  BlogShareEntity({
    required this.id,
    required this.createdAt,
    required this.blogId,
    required this.userId,
  });
}
