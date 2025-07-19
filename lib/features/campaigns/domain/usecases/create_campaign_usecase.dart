
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/data/dto/create_campaign_dto.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/campaign_repository.dart';

class CreateCampaignUseCase extends UseCase<CampaignEntity, CreateCampaignParams> {
  final CampaignRepository repository;

  CreateCampaignUseCase(this.repository);

  @override
  Future<Either<Failure, CampaignEntity>> call(CreateCampaignParams params) async {
    return await repository.createCampaign(
        params.dto, params.documents, params.midias, params.cover);
  }
}

class CreateCampaignParams extends Equatable {
  final CreateCampaignDto dto;
  final List<MultipartFile> documents;
  final List<MultipartFile> midias;
  final MultipartFile cover;

  const CreateCampaignParams({
    required this.dto,
    required this.documents,
    required this.midias,
    required this.cover,
  });

  @override
  List<Object?> get props => [dto, documents, midias, cover];
}
