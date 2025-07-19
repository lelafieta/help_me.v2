
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/data/dto/create_campaign_dto.dart';
import 'package:help_me/features/campaigns/data/dto/update_campaign_dto.dart';

abstract class CampaignRepository {
  Future<Either<Failure, CampaignEntity>> createCampaign(
      CreateCampaignDto dto, List<MultipartFile> documents, List<MultipartFile> midias, MultipartFile cover);
  Future<Either<Failure, List<CampaignEntity>>> getAllCampaigns();
  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByUserId(int userId);
  Future<Either<Failure, CampaignEntity>> getCampaignById(int id);
  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByCategoryId(int categoryId);
  Future<Either<Failure, List<CampaignEntity>>> getMyCampaignsByStatus(int userId, String status);
  Future<Either<Failure, List<CampaignEntity>>> getUrgentCampaignsSmart(int userId);
  Future<Either<Failure, CampaignEntity>> updateCampaign(int id, UpdateCampaignDto dto);
  Future<Either<Failure, void>> deleteCampaign(int id);
}
