import '../models/event_model.dart';

abstract class IEventDataSource {
  Future<List<EventModel>> fetchNearbyEvents();
  Future<EventModel?> getEventById(String id);
  Future<List<EventModel>> getEventsByCommunityId(String commintyId);
}
