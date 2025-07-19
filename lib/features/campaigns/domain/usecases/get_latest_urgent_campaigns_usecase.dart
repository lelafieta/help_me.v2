import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_entity.dart';
import '../repositories/i_campaign_repository.dart';

class GetLatestUrgentCampaignsUseCase
    extends UseCase<List<CampaignEntity>, NoParams> {
  final ICampaignRepository repository;

  GetLatestUrgentCampaignsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(NoParams params) async {
    throw UnimplementedError();
  }
}
