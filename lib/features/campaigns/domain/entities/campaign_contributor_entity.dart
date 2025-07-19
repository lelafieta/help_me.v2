import '../../../../core/entities/user_entity.dart';

class CampaignContributorEntity {
  final int id;
  final int campaignId;
  final int userId;
  final num money;
  final bool isAnonymous;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserEntity user;

  CampaignContributorEntity({
    required this.id,
    required this.campaignId,
    required this.userId,
    required this.money,
    required this.isAnonymous,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}
