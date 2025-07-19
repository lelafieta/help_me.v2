
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/i_campaign_repository.dart';

class GetCampaignsByUserIdUseCase extends UseCase<List<CampaignEntity>, GetCampaignsByUserIdParams> {
  final CampaignRepository repository;

  GetCampaignsByUserIdUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(GetCampaignsByUserIdParams params) async {
    return await repository.getCampaignsByUserId(params.userId);
  }
}

class GetCampaignsByUserIdParams extends Equatable {
  final int userId;

  const GetCampaignsByUserIdParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
