
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/i_campaign_repository.dart';

class GetCampaignsByCategoryIdUseCase extends UseCase<List<CampaignEntity>, GetCampaignsByCategoryIdParams> {
  final CampaignRepository repository;

  GetCampaignsByCategoryIdUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(GetCampaignsByCategoryIdParams params) async {
    return await repository.getCampaignsByCategoryId(params.categoryId);
  }
}

class GetCampaignsByCategoryIdParams extends Equatable {
  final int categoryId;

  const GetCampaignsByCategoryIdParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
