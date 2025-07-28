import '../../domain/entities/campaign_document_entity.dart';

class CampaignDocumentModel extends CampaignDocumentEntity {
  CampaignDocumentModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.campaignId,
    super.documentPath,
    super.userId,
    super.isApproved,
  });

  factory CampaignDocumentModel.fromJson(Map<String, dynamic> json) {
    return CampaignDocumentModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      userId: json['userId'] as String?,
      campaignId: json['campaignId'] as String?,
      documentPath: json['documentPath'] as String?,
      isApproved: json['isApproved'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'documentPath': documentPath,
      'campaignId': campaignId,
      'userId': userId,
      'isApproved': isApproved,
    };
  }
}
