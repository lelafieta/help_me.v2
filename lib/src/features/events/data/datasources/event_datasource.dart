import 'package:dio/dio.dart';
import 'package:utueji/src/features/events/data/models/event_model.dart';
import 'i_event_datasource.dart';

class EventDataSource extends IEventDataSource {
  final Dio dio;

  EventDataSource({required this.dio});

  @override
  Future<List<EventModel>> fetchNearbyEvents() async {
    final response = await dio.get('/events/nearby');
    return (response.data as List)
        .map((json) => EventModel.fromJson(json))
        .toList();
  }

  @override
  Future<EventModel?> getEventById(String id) async {
    final response = await dio.get('/events/$id');
    final json = response.data as dynamic;
    if (json == null) {
      return null;
    }
    return EventModel.fromJson(json);
  }
}
