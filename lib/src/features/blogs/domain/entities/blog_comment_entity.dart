class BlogCommentEntity {
  final String id;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String blogId;
  final String userId;

  BlogCommentEntity({
    required this.id,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    required this.blogId,
    required this.userId,
  });
}
