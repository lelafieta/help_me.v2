import '../../domain/entities/campaign_update_entity.dart';

class CampaignUpdateModel extends CampaignUpdateEntity {
  CampaignUpdateModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.title,
    super.description,
    super.campaignId,
    super.userId,
  });

  factory CampaignUpdateModel.fromJson(Map<String, dynamic> json) {
    return CampaignUpdateModel(
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      title: json['title'] as String?,
      description: json['description'] as String?,
      campaignId: json['campaignId'] as String?,
      userId: json['userId'] as String?,
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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'campaign_id': campaignId,
      'user_id': userId,
    };
  }
}
