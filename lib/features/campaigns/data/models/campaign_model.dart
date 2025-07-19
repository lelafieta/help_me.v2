import '../../../../core/models/user_model.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../ongs/data/models/ong_model.dart';
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
    required final UserModel user,
    required final CategoryModel category,
    final List<CampaignContributorModel>? campaignContributors,
    final List<CampaignDocumentModel>? campaignDocuments,
    final List<CampaignMidiaModel>? campaignMidias,
    final List<CampaignUpdateModel>? campaignUpdates,
    final List<CampaignCommentModel>? campaignComments,
    final OngModel? ong,
  }) : super(
         user: user,
         category: category,
         campaignContributors: campaignContributors,
         campaignDocuments: campaignDocuments,
         campaignMidias: campaignMidias,
         campaignUpdates: campaignUpdates,
         campaignComments: campaignComments,
         ong: ong,
       );

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageCoverUrl: json['imageCoverUrl'],
      mediaUrls: List<String>.from(json['mediaUrls'] ?? []),
      documentUrls: List<String>.from(json['documentUrls'] ?? []),
      status: json['status'],
      userId: json['userId'],
      user: UserModel.fromJson(json['user']),
      categoryId: json['categoryId'],
      category: CategoryModel.fromJson(json['category']),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      fundraisingGoal: (json['fundraisingGoal'] as num).toDouble(),
      fundsRaised: (json['fundsRaised'] != null)
          ? (json['fundsRaised'] as num).toDouble()
          : 0,
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

      campaignContributors: (json['campaignContributors'] == null)
          ? null
          : (json['campaignContributors'] as List?)
                ?.map((e) => CampaignContributorModel.fromJson(e))
                .toList(),
      campaignUpdates: (json['campaignUpdates'] as List?)
          ?.map((e) => CampaignUpdateModel.fromJson(e))
          .toList(),
      campaignMidias: (json['campaignMidias'] as List?)
          ?.map((e) => CampaignMidiaModel.fromJson(e))
          .toList(),
      campaignComments: (json['campaignComments'] as List?)
          ?.map((e) => CampaignCommentModel.fromJson(e))
          .toList(),
      campaignDocuments: (json['campaignDocuments'] as List?)
          ?.map((e) => CampaignDocumentModel.fromJson(e))
          .toList(),

      ong: json['ong'] != null ? OngModel.fromJson(json['ong']) : null,
    );
  }
}
