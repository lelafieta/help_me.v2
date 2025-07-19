import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campaign_entity.dart';
import '../repositories/i_campaign_repository.dart';

class GetCampaignsByCategoryIdUseCase
    extends UseCase<List<CampaignEntity>, GetCampaignsByCategoryIdParams> {
  final ICampaignRepository repository;

  GetCampaignsByCategoryIdUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(
    GetCampaignsByCategoryIdParams params,
  ) async {
    return await repository.getCampaignsByCategoryId(params.categoryId);
  }
}

class GetCampaignsByCategoryIdParams extends Equatable {
  final int categoryId;

  const GetCampaignsByCategoryIdParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
