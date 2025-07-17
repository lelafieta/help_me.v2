
import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/campaign_repository.dart';

class GetAllCampaignsUseCase extends UseCase<List<CampaignEntity>, NoParams> {
  final CampaignRepository repository;

  GetAllCampaignsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(NoParams params) async {
    return await repository.getAllCampaigns();
  }
}
