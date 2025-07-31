import 'package:equatable/equatable.dart';

class FeedViewEntity extends Equatable {
  final String id;
  final String feedId;
  final String userId;
  final String ip;
  final String userAgent;
  final DateTime viewedAt;

  const FeedViewEntity({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.ip,
    required this.userAgent,
    required this.viewedAt,
  });

  @override
  List<Object?> get props => [id, feedId, userId, ip, userAgent, viewedAt];
}
