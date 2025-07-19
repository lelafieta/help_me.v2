import '../../domain/entities/campaign_midia_entity.dart';

class CampaignMidiaModel extends CampaignMidiaEntity {
  CampaignMidiaModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.midiaUrl,
    required super.campaignId,
    required super.userId,
    required super.midiaType,
  });

  factory CampaignMidiaModel.fromJson(Map<String, dynamic> json) {
    print(json['id'].runtimeType);
    return CampaignMidiaModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      campaignId: json['campaignId'],
      userId: json['userId'],
      midiaUrl: json['midiaUrl'],
      midiaType: json['midiaType'],
    );
  }
}
