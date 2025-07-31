import '../../../auth/data/models/user_model.dart';
import '../../../ongs/data/models/ong_model.dart';
import '../../domain/entities/event_entity.dart';
import 'event_participant_model.dart';

class EventModel extends EventEntity {
  EventModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.ongId,
    super.userId,
    super.title,
    super.location,
    super.description,
    super.backgroundImageUrl,
    super.startDate,
    super.endDate,
    super.ong,
    super.user,
    super.distanceKm,
    super.isFavorite,
    required super.eventParticipants,
  });

  // Factory para criar uma instância de EventModel a partir de um Map
  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
      ongId: map['ongId'],
      userId: map['userId'],
      title: map['title'],
      location: map['location'],
      description: map['description'],
      isFavorite: map['isFavorite'],
      backgroundImageUrl: map['backgroundImageUrl'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      eventParticipants: List<EventParticipantModel>.from(
        map['eventParticipants'].map((x) => EventParticipantModel.fromJson(x)),
      ),
      distanceKm: (map['distanceKm'] as num),
      ong: (map['ong'] != null) ? OngModel.fromJson(map['ong']) : null,
      user: (map['user'] != null) ? UserModel.fromJson(map['user']) : null,
    );
  }

  // Método para converter o objeto EventModel para um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ongId': ongId,
      'userId': userId,
      'title': title,
      'location': location,
      'description': description,
      'backgroundImageUrl': backgroundImageUrl,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
