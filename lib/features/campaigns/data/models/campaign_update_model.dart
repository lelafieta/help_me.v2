import '../../domain/entities/campaign_update_entity.dart';

class CampaignUpdateModel extends CampaignUpdateEntity {
  CampaignUpdateModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.title,
    required super.description,
    required super.campaignId,
    required super.userId,
  });

  factory CampaignUpdateModel.fromJson(Map<String, dynamic> json) {
    return CampaignUpdateModel(
      id: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      description: json['description'],
      campaignId: json['campaignId'],
      userId: json['userId'],
    );
  }

  factory CampaignUpdateModel.fromEntity(CampaignUpdateEntity entity) {
    return CampaignUpdateModel(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      title: entity.title,
      description: entity.description,
      campaignId: entity.campaignId,
      userId: entity.userId,
    );
  }
}
