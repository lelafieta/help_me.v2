import '../../../categories/data/models/category_model.dart';
import '../../domain/entities/campaign_entity.dart';
import 'campaign_comment_model.dart';
import 'campaign_contribuitor_model.dart';
import 'campaign_document_model.dart';
import 'campaign_midia_model.dart';
import 'campaign_update_model.dart';

class CampaignModel extends CampaignEntity {
  const CampaignModel({
    super.id,
    super.title,
    super.description,
    super.imageCoverUrl,
    super.mediaUrls,
    super.documentUrls,
    super.status,
    super.userId,
    super.categoryId,
    super.startDate,
    super.endDate,
    super.location,
    super.phoneNumber,
    required super.fundraisingGoal,
    super.fundsRaised,
    super.beneficiaryName,
    super.campaignType,
    super.currency,
    super.birth,
    super.urgencyScore,
    super.createdAt,
    super.updatedAt,
    required super.isActivate,
    required super.category,
    super.campaignDocuments,
    super.campaignComments,
    super.campaignMidias,
    super.campaignUpdates,
    super.campaignContributor,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    print(json["campaignContributor"]);
    return CampaignModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageCoverUrl: json['imageCoverUrl'],
      mediaUrls: List<String>.from(json['mediaUrls'] ?? []),
      documentUrls: List<String>.from(json['documentUrls'] ?? []),
      status: json['status'],
      userId: json['userId'],
      categoryId: json['categoryId'],
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      fundraisingGoal: (json['fundraisingGoal'] as num).toDouble(),
      fundsRaised: (json['fundsRaised'] != null)
          ? (json['fundsRaised'] as num).toDouble()
          : null,
      beneficiaryName: json['beneficiaryName'],
      campaignType: json['campaignType'],
      currency: json['currency'],
      birth: json['birth'] != null ? DateTime.parse(json['birth']) : null,
      urgencyScore: json['urgencyScore'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      isActivate: json['isActivate'] as bool,
      category: CategoryModel.fromJson(json['category']),
      campaignContributor: (json["campaignContributor"] == null)
          ? null
          : (json['campaignContributor'] as List?)
                ?.map((json) => CampaignContributorModel.fromJson(json))
                .toList(),
      campaignUpdates: (json["campaignUpdates"] == null)
          ? null
          : (json['campaignUpdates'] as List?)
                ?.map((json) => CampaignUpdateModel.fromJson(json))
                .toList(),
      campaignMidias: (json["campaignMidias"] == null)
          ? null
          : (json['campaignMidias'] as List?)
                ?.map((json) => CampaignMidiaModel.fromJson(json))
                .toList(),
      campaignComments: (json["campaignComments"] == null)
          ? null
          : (json['campaignComments'] as List?)
                ?.map((json) => CampaignCommentModel.fromJson(json))
                .toList(),

      campaignDocuments: (json["campaignDocuments"] == null)
          ? null
          : (json['campaignDocuments'] as List?)
                ?.map((json) => CampaignDocumentModel.fromJson(json))
                .toList(),
    );
  }
}
