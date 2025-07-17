
import 'package:dio/dio.dart';
import 'package:help_me/features/campaigns/data/models/campaign_model.dart';
import 'package:help_me/features/campaigns/data/models/create_campaign_dto.dart';
import 'package:help_me/features/campaigns/data/models/update_campaign_dto.dart';

abstract class CampaignRemoteDataSource {
  Future<CampaignModel> createCampaign(
      CreateCampaignDto dto, List<MultipartFile> documents, List<MultipartFile> midias, MultipartFile cover);
  Future<List<CampaignModel>> getAllCampaigns();
  Future<List<CampaignModel>> getCampaignsByUserId(int userId);
  Future<CampaignModel> getCampaignById(int id);
  Future<List<CampaignModel>> getCampaignsByCategoryId(int categoryId);
  Future<List<CampaignModel>> getMyCampaignsByStatus(int userId, String status);
  Future<List<CampaignModel>> getUrgentCampaignsSmart(int userId);
  Future<CampaignModel> updateCampaign(int id, UpdateCampaignDto dto);
  Future<void> deleteCampaign(int id);
}
