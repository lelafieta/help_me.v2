import '../../domain/entities/campaign_params.dart';
import '../models/campaign_model.dart';

abstract class ICampaignRemoteDataSource {
  Future<List<CampaignModel>> getAllCampaigns(CampaignParams params);
  Future<List<CampaignModel>> getAllMyCampaigns({String? status});
  Future<List<CampaignModel>> getAllUrgentCampaigns(CampaignParams params);
  Future<List<CampaignModel>> getLatestUrgentCampaigns();
  Future<CampaignModel> getCampaignById(String id);
  Future<void> createCampaign(CampaignModel campaign);
  Future<void> updateCampaign(CampaignModel campaign);
  Future<void> deleteCampaign(String id);
}
