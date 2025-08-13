import '../../domain/entities/share_entity.dart';

class ShareModel extends ShareEntity {
  const ShareModel({
    required super.id,
    required super.userId,
    required super.createdAt,
    super.postId,
    super.blogId,
    super.feedId,
    super.communityId,
  });

  factory ShareModel.fromJson(Map<String, dynamic> json) {
    return ShareModel(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      postId: json['postId'],
      blogId: json['blogId'],
      feedId: json['feedId'],
      communityId: json['communityId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'postId': postId,
      'blogId': blogId,
      'feedId': feedId,
      'communityId': communityId,
    };
  }
}
