class ResourceEntity {
  final String id;
  final String title;
  final String type;
  final String url;
  final DateTime uploadedAt;
  final String? postId;
  final String? communityId;
  final String uploaderId;

  ResourceEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
    required this.uploadedAt,
    this.postId,
    this.communityId,
    required this.uploaderId,
  });
}
