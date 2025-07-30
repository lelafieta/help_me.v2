import '../../../../core/utils/campaign_status_extension.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../ongs/data/models/ong_model.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/enums/campaign_status.dart';
import 'campaign_comment_model.dart';
import 'campaign_contribuitor_model.dart';
import 'campaign_document_model.dart';
import 'campaign_midia_model.dart';
import 'campaign_update_model.dart';

class CampaignModel extends CampaignEntity {
  CampaignModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.categoryId,
    super.description,
    super.fundraisingGoal,
    super.fundsRaised,
    super.imageCoverUrl,
    super.institution,
    super.location,
    super.numberOfContributions,
    super.ongId,
    super.beneficiaryName,
    super.birth,
    super.campaignType,
    super.currency,
    super.isActivate,
    super.phoneNumber,
    super.priority = 0,
    super.isUrgent,
    super.endDate,
    super.title,
    super.isFavorited,
    super.userId,
    super.status,
    super.startDate,
    super.category,
    super.ong,
    super.user,
    super.contributors,
    super.documents,
    super.updates,
    super.comments,
    super.midias,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> map) {
    return CampaignModel(
      id: map['id'],
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
      categoryId: map['categoryId'],
      description: map['description'],
      fundraisingGoal: (map['fundraisingGoal'] != null)
          ? map['fundraisingGoal'].toDouble()
          : null,
      fundsRaised: (map['fundsRaised'] != null)
          ? map['fundsRaised'].toDouble()
          : null,
      imageCoverUrl: map['imageCoverUrl'],
      institution: map['institution'],
      location: map['location'],
      isActivate: map['isActivate'],
      numberOfContributions: map['numberOfContributions'],
      ongId: map['ongId'],
      // isFavorited: map['is_favorited'],
      phoneNumber: map['phoneNumber'],
      priority: map['priority'] ?? 0,
      isUrgent: map['isUrgent'],
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      title: map['title'],
      userId: map['userId'],
      status: CampaignStatusExtension.fromString(map['status'] as String),
      birth: map['birth'] != null ? DateTime.parse(map['birth']) : null,
      currency: map["currency"],
      beneficiaryName: map["beneficiaryName"],
      campaignType: map["campaignType"],
      startDate: map['startDate'] != null
          ? DateTime.parse(map['startDate'])
          : null,
      category: map['category'] != null
          ? CategoryModel.fromJson(map['category'])
          : null,
      ong: map['ong'] != null ? OngModel.fromJson(map['ong']) : null,
      user: map['user'] != null ? UserModel.fromJson(map['user']) : null,
      contributors: map['campaignContributors'] != null
          ? List<CampaignContributorModel>.from(
              map['campaignContributors'].map(
                (x) => CampaignContributorModel.fromJson(x),
              ),
            )
          : [],
      documents: map['campaignDocuments'] != null
          ? List<CampaignDocumentModel>.from(
              map['campaignDocuments'].map(
                (x) => CampaignDocumentModel.fromJson(x),
              ),
            )
          : [],
      updates: map['campaignUpdates'] != null
          ? List<CampaignUpdateModel>.from(
              map['campaignUpdates'].map(
                (x) => CampaignUpdateModel.fromJson(x),
              ),
            )
          : [],
      comments: map['campaignComments'] != null
          ? List<CampaignCommentModel>.from(
              map['campaignComments'].map(
                (x) => CampaignCommentModel.fromJson(x),
              ),
            )
          : [],
      midias: map['campaignMidias'] != null
          ? List<CampaignMidiaModel>.from(
              map['campaignMidias'].map((x) => CampaignMidiaModel.fromJson(x)),
            )
          : [],
    );
  }

  CampaignModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? categoryId,
    String? description,
    double? fundraisingGoal,
    double? fundsRaised,
    String? imageCoverUrl,
    String? institution,
    String? location,
    int? numberOfContributions,
    String? ongId,
    String? phoneNumber,
    int? priority,
    DateTime? endDate,
    String? title,
    String? userId,
    CampaignStatus? status,
    DateTime? startDate,
    CategoryModel? category,
    OngModel? ong,
    UserModel? user,
    List<CampaignContributorModel>? campaignContributors,
  }) {
    return CampaignModel(
      id: id ?? this.id!,
      createdAt: createdAt ?? this.createdAt!,
      updatedAt: updatedAt ?? this.updatedAt!,
      categoryId: categoryId ?? this.categoryId!,
      description: description ?? this.description!,
      fundraisingGoal: fundraisingGoal ?? this.fundraisingGoal!,
      fundsRaised: fundsRaised ?? this.fundsRaised!,
      imageCoverUrl: imageCoverUrl ?? this.imageCoverUrl!,
      institution: institution ?? this.institution!,
      location: location ?? this.location!,
      numberOfContributions:
          numberOfContributions ?? this.numberOfContributions,
      ongId: ongId ?? this.ongId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      priority: priority ?? this.priority,
      endDate: endDate ?? this.endDate,
      title: title ?? this.title,
      userId: userId ?? this.userId!,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate!,
      category: category ?? this.category!,
      ong: ong ?? this.ong!,
      user: user ?? this.user!,
      contributors: campaignContributors ?? this.contributors!,
    );
  }

  // Method to convert the CampaignModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'categoryId': categoryId,
      'description': description,
      'fundraisingGoal': fundraisingGoal,
      'fundsRaised': fundsRaised,
      'imageCoverUrl': imageCoverUrl,
      'institution': institution,
      'location': location,
      'status': status,
      'numberOfContributions': numberOfContributions,
      'ongId': ongId,
      'phoneNumber': phoneNumber,
      'priority': priority,
      'isUrgent': isUrgent,
      'isActivate': isActivate,
      'endDate': endDate?.toIso8601String(),
      'birth': birth?.toIso8601String(),
      'currency': currency,
      'campaignType': campaignType,
      'beneficiaryName': beneficiaryName,
      'title': title,
      'userId': userId,
      'startDate': startDate?.toIso8601String(),
    };
  }
}
