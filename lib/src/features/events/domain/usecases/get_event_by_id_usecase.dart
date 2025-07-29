import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/event_entity.dart';
import '../repositories/i_event_repository.dart';

class GetEventByUsecase extends UseCase<EventEntity?, String> {
  final IEventRepository repository;

  GetEventByUsecase({required this.repository});

  @override
  Future<Either<Failure, EventEntity?>> call(String params) {
    return repository.getEventById(params);
  }
}
