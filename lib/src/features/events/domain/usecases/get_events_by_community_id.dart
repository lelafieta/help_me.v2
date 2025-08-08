import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/event_entity.dart';
import '../repositories/i_event_repository.dart';

class GetEventsByCommunityIdUsecase
    extends BaseUseCase<List<EventEntity>, String> {
  final IEventRepository repository;

  GetEventsByCommunityIdUsecase({required this.repository});

  @override
  Future<Either<Failure, List<EventEntity>>> call(String params) {
    return repository.getEventsByCommunityId(params);
  }
}
