class CampaignUpdateEntity {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String description;
  final int userId;
  final int campaignId;

  CampaignUpdateEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.campaignId,
    required this.userId,
  });
}
