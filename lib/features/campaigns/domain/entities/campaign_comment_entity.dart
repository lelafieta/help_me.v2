import '../../../../core/entities/user_entity.dart';

class CampaignCommentEntity {
  final int id;
  final int userId;
  final int campaignId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserEntity user;

  CampaignCommentEntity({
    required this.id,
    required this.userId,
    required this.campaignId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}
