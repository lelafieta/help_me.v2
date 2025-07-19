import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_update_entity.dart';
import '../repositories/i_update_repository.dart';

class GetCampaignUpdatesUseCase
    extends UseCase<List<CampaignUpdateEntity>, String> {
  final IUpdateRepository repository;

  GetCampaignUpdatesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CampaignUpdateEntity>>> call(
    String params,
  ) async {
    return await repository.listCampaignUpdates(params);
  }
}
