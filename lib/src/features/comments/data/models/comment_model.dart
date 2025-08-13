import '../../domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.content,
    required super.userId,
    required super.createdAt,
    super.postId,
    super.blogId,
    super.feedId,
    super.campaignId,
    super.eventId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json['content'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      postId: json['postId'],
      blogId: json['blogId'],
      feedId: json['feedId'],
      campaignId: json['campaignId'],
      eventId: json['eventId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'postId': postId,
      'blogId': blogId,
      'feedId': feedId,
      'campaignId': campaignId,
      'eventId': eventId,
    };
  }
}
