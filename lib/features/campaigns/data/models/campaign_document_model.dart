import '../../domain/entities/campaign_document_entity.dart';

class CampaignDocumentModel extends CampaignDocumentEntity {
  CampaignDocumentModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.campaignId,
    required super.documentPath,
    required super.userId,
    required super.isApproved,
  });

  factory CampaignDocumentModel.fromJson(Map<String, dynamic> json) {
    print("type");
    print(json['id'].runtimeType);
    return CampaignDocumentModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['userId'],
      campaignId: json['campaignId'],
      documentPath: json['documentPath'],
      isApproved: json['isApproved'] as bool,
    );
  }
}
