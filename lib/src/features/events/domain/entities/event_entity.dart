import 'package:utueji/src/features/events/domain/entities/event_participant_entity.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../ongs/domain/entities/ong_entity.dart';

class EventEntity {
  final String? id;
  final DateTime? createdAt;
  final String? ongId;
  final String? userId;
  final String? title;
  final String? location;
  final String? description;
  final String? backgroundImageUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? updatedAt;
  final num? distanceKm;
  final OngEntity? ong;
  final UserEntity? user;
  final bool? isFavorite;
  final List<EventParticipantEntity> eventParticipants;

  EventEntity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.ongId,
    this.userId,
    this.title,
    this.location,
    this.description,
    this.backgroundImageUrl,
    this.startDate,
    this.endDate,
    this.ong,
    this.user,
    this.distanceKm,
    this.isFavorite,
    required this.eventParticipants,
  });
}
