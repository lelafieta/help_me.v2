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
      campaignId: json['campaign_id'],
      userId: json['user_id'],
      money: json['money'],
      isAnonymous: json['is_anonymous'],
      user: UserModel.fromJson(json['user']),
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
