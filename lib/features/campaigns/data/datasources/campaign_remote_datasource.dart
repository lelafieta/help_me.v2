import 'package:dio/dio.dart';
import '../dto/create_campaign_dto.dart';
import '../dto/update_campaign_dto.dart';
import '../models/campaign_model.dart';
import 'i_campaign_remote_data_source.dart';

class CampaignRemoteDataSource implements ICampaignRemoteDataSource {
  final Dio dio;

  CampaignRemoteDataSource({required this.dio});

  @override
  Future<CampaignModel> createCampaign(
    CreateCampaignDto dto,
    List<MultipartFile> documents,
    List<MultipartFile> midias,
    MultipartFile cover,
  ) async {
    final formData = FormData.fromMap({
      'title': dto.title,
      'description': dto.description,
      'status': dto.status,
      'userId': dto.userId,
      'categoryId': dto.categoryId,
      'imageCoverUrl': cover,
      'campaignDocuments': documents,
      'campaignMidias': midias,
    });
    final response = await dio.post('/campaigns', data: formData);
    return CampaignModel.fromJson(response.data);
  }

  @override
  Future<List<CampaignModel>> getAllCampaigns() async {
    final response = await dio.get('/campaigns');
    return (response.data as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CampaignModel>> getCampaignsByUserId(int userId) async {
    final response = await dio.get('/campaigns/user/$userId');
    return (response.data as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<CampaignModel> getCampaignById(int id) async {
    final response = await dio.get('/campaigns/$id');
    return CampaignModel.fromJson(response.data);
  }

  @override
  Future<List<CampaignModel>> getCampaignsByCategoryId(int categoryId) async {
    final response = await dio.get('/campaigns/category/$categoryId');
    return (response.data as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CampaignModel>> getMyCampaignsByStatus(
    int userId,
    String status,
  ) async {
    final response = await dio.get(
      '/campaigns/my-campaigns/$status',
      queryParameters: {'userId': userId},
    );
    return (response.data as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CampaignModel>> getUrgentCampaignsSmart(int userId) async {
    final response = await dio.get(
      '/campaigns/smart-urgent',
      queryParameters: {'userId': userId},
    );
    return (response.data as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<CampaignModel> updateCampaign(int id, UpdateCampaignDto dto) async {
    final response = await dio.patch('/campaigns/$id', data: dto.toJson());
    return CampaignModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCampaign(int id) async {
    await dio.delete('/campaigns/$id');
  }
}
