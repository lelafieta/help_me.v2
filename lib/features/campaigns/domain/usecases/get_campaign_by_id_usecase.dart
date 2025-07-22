import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';

import '../../data/repositories/campaign_repository.dart';

class GetCampaignByIdUseCase
    extends UseCase<CampaignEntity, GetCampaignByIdParams> {
  final CampaignRepository repository;

  GetCampaignByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, CampaignEntity>> call(
    GetCampaignByIdParams params,
  ) async {
    return await repository.getCampaignById(params.id);
  }
}

class GetCampaignByIdParams extends Equatable {
  final int id;

  const GetCampaignByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
