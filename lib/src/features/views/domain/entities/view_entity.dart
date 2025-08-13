class ViewEntity {
  final String id;
  final String? userId;
  final String? ipAddress;
  final DateTime createdAt;
  final String? postId;
  final String? blogId;
  final String? feedId;

  const ViewEntity({
    required this.id,
    this.userId,
    this.ipAddress,
    required this.createdAt,
    this.postId,
    this.blogId,
    this.feedId,
  });
}
