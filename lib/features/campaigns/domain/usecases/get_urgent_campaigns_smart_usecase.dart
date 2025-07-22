import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/i_campaign_repository.dart';

class GetUrgentCampaignsSmartUseCase
    extends UseCase<List<CampaignEntity>, GetUrgentCampaignsSmartParams> {
  final ICampaignRepository repository;

  GetUrgentCampaignsSmartUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(
    GetUrgentCampaignsSmartParams params,
  ) async {
    return await repository.getUrgentCampaignsSmart(params.userId);
  }
}

class GetUrgentCampaignsSmartParams extends Equatable {
  final int userId;

  const GetUrgentCampaignsSmartParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
