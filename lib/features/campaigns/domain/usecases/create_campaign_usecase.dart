import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_entity.dart';
import '../params/create_campaign_params.dart';
import '../repositories/i_campaign_repository.dart';

class CreateCampaignUseCase extends UseCase<CampaignEntity, CreateCampaignParams> {
  final ICampaignRepository repository;

  CreateCampaignUseCase({required this.repository});

  @override
  Future<Either<Failure, CampaignEntity>> call(
    CreateCampaignParams params,
  ) async {
    return await repository.createCampaign(params);
  }
}
