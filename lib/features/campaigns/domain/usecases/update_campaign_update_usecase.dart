import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_update_entity.dart';
import '../repositories/i_update_repository.dart';

class UpdateCampaignUpdateUseCase
    extends UseCase<Unit, CampaignUpdateEntity> {
  final IUpdateRepository repository;
  UpdateCampaignUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(CampaignUpdateEntity params) async {
    return await repository.update(params);
  }
}
