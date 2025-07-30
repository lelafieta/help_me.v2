import 'package:utueji/src/features/auth/data/models/user_model.dart';

import '../../domain/entities/campaign_contributor_entity.dart';

class CampaignContributorModel extends CampaignContributorEntity {
  CampaignContributorModel({
    super.id,
    super.campaignId,
    super.userId,
    super.money,
    super.isAnonymous,
    super.updatedAt,
    super.createdAt,
    super.user,
    super.campaign,
  });

  factory CampaignContributorModel.fromJson(Map<String, dynamic> json) {
    return CampaignContributorModel(
      id: json['id'],
      campaignId: json['campaignId'],
      userId: json['userId'],
      money: num.parse(json['money']),
      isAnonymous: json['isAnonymous'],
      user: (json['user'] == null) ? null : UserModel.fromJson(json['user']),
      campaign: json['campaign'],
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }
}
