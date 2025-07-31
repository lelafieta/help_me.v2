import '../../domain/entities/feed_view_entity.dart';

class FeedViewModel extends FeedViewEntity {
  const FeedViewModel({
    required super.id,
    required super.feedId,
    required super.userId,
    required super.ip,
    required super.userAgent,
    required super.viewedAt,
  });

  factory FeedViewModel.fromJson(Map<String, dynamic> json) {
    return FeedViewModel(
      id: json['id'] as String,
      feedId: json['feedId'] as String,
      userId: json['userId'] as String,
      ip: json['ip'] as String,
      userAgent: json['userAgent'] as String,
      viewedAt: DateTime.parse(json['viewedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feedId': feedId,
      'userId': userId,
      'ip': ip,
      'userAgent': userAgent,
      'viewedAt': viewedAt.toIso8601String(),
    };
  }
}
