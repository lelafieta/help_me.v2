import '../../../../core/models/user_model.dart';
import '../../domain/entities/campaign_comment_entity.dart';

class CampaignCommentModel extends CampaignCommentEntity {
  CampaignCommentModel({
    required super.id,
    required super.userId,
    required super.campaignId,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
  });

  factory CampaignCommentModel.fromJson(Map<String, dynamic> json) {
    return CampaignCommentModel(
      id: json['id'],
      userId: json['user_id'],
      campaignId: json['campaignId'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: UserModel.fromJson(json['user']),
    );
  }
}
