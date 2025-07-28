import '../../domain/entities/campaign_midia_entity.dart';

class CampaignMidiaModel extends CampaignMidiaEntity {
  CampaignMidiaModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.midiaUrl,
    super.campaignId,
    super.userId,
    super.midiaType,
  });

  factory CampaignMidiaModel.fromJson(Map<String, dynamic> json) {
    return CampaignMidiaModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      campaignId: json['campaignId'] as String?,
      userId: json['userId'] as String?,
      midiaUrl: json['midiaUrl'] as String?,
      midiaType: json['midiaType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'campaignId': campaignId,
      'midiaUrl': midiaUrl,
      'midiaType': midiaType,
      'userId': userId,
    };
  }
}
