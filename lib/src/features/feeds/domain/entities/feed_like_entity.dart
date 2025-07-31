import 'package:equatable/equatable.dart';

class FeedLikeEntity extends Equatable {
  final String id;
  final String feedId;
  final String userId;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const FeedLikeEntity({
    required this.id,
    required this.feedId,
    required this.userId,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    feedId,
    userId,
    description,
    createdAt,
    updatedAt,
  ];
}
