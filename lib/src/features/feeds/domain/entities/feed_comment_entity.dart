import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/user_entity.dart';

class FeedCommentEntity extends Equatable {
  final String id;
  final String description;
  final String userId;
  final String feedId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserEntity user;

  const FeedCommentEntity({
    required this.id,
    required this.description,
    required this.userId,
    required this.feedId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  @override
  List<Object?> get props => [
    id,
    description,
    userId,
    feedId,
    updatedAt,
    createdAt,
    user,
  ];
}
