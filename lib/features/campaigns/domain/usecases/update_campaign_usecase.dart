
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/data/dto/update_campaign_dto.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/campaign_repository.dart';

class UpdateCampaignUseCase extends UseCase<CampaignEntity, UpdateCampaignParams> {
  final CampaignRepository repository;

  UpdateCampaignUseCase(this.repository);

  @override
  Future<Either<Failure, CampaignEntity>> call(UpdateCampaignParams params) async {
    return await repository.updateCampaign(params.id, params.dto);
  }
}

class UpdateCampaignParams extends Equatable {
  final int id;
  final UpdateCampaignDto dto;

  const UpdateCampaignParams({
    required this.id,
    required this.dto,
  });

  @override
  List<Object?> get props => [id, dto];
}
