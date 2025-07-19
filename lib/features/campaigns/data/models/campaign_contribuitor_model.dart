import '../../../../core/models/user_model.dart';
import '../../domain/entities/campaign_contributor_entity.dart';

class CampaignContributorModel extends CampaignContributorEntity {
  CampaignContributorModel({
    required super.id,
    required super.campaignId,
    required super.userId,
    required super.money,
    required super.isAnonymous,
    required super.updatedAt,
    required super.createdAt,
    required super.user,
  });

  factory CampaignContributorModel.fromJson(Map<String, dynamic> json) {
    return CampaignContributorModel(
      id: json['id'],
      campaignId: json['campaignId'],
      userId: json['userId'],
      money: (num.parse(json['money'])),
      isAnonymous: json['isAnonymous'],
      user: UserModel.fromJson(json['user']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
