import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/user_entity.dart';

class EventParticipantEntity extends Equatable {
  final String id;
  final String eventId;
  final String userId;
  final DateTime joinedAt;
  final UserEntity user;

  const EventParticipantEntity({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.joinedAt,
    required this.user,
  });

  @override
  List<Object?> get props => [id, eventId, userId, joinedAt, user];
}
