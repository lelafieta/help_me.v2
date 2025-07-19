class CampaignMidiaEntity {
  final int id;
  final int userId;
  final String midiaUrl;
  final String midiaType;
  final int campaignId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CampaignMidiaEntity({
    required this.id,
    required this.midiaType,
    required this.campaignId,
    required this.createdAt,
    required this.updatedAt,
    required this.midiaUrl,
    required this.userId,
  });
}
