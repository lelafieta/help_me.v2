import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_entity.dart';

class CreateCampaignUseCase extends UseCase<Unit, CampaignEntity> {
  final ICampaignRepository repository;

  CreateCampaignUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(CampaignEntity params) async {
    return await repository.createCampaign(params);
  }
}
