import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event_entity.dart';

abstract class IEventRepository {
  Future<Either<Failure, List<EventEntity>>> getNearbyEvents();
  Future<Either<Failure, EventEntity?>> getEventById(String id);
}
