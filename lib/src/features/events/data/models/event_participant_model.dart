import '../../../auth/data/models/user_model.dart';
import '../../domain/entities/event_participant_entity.dart';

class EventParticipantModel extends EventParticipantEntity {
  const EventParticipantModel({
    required super.id,
    required super.eventId,
    required super.userId,
    required super.joinedAt,
    required super.user,
  });

  factory EventParticipantModel.fromJson(Map<String, dynamic> json) {
    return EventParticipantModel(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'joinedAt': joinedAt.toIso8601String(),
    };
  }
}
