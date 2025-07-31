import 'package:equatable/equatable.dart';

class FeedCommentEntity extends Equatable {
  final String id;
  final String feedId;
  final String userId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const FeedCommentEntity({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.description,
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
