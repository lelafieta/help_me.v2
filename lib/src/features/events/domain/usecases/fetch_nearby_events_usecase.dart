import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';

import '../../../../core/usecases/base_usecase.dart';
import '../entities/event_entity.dart';
import '../repositories/i_event_repository.dart';

class GetNearbyEventsUsecase extends BaseUseCase<List<EventEntity>, NoParams> {
  final IEventRepository repository;

  GetNearbyEventsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<EventEntity>>> call(NoParams params) {
    return repository.getNearbyEvents();
  }
}
