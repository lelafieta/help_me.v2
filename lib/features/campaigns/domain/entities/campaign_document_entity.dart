class CampaignDocumentEntity {
  final int id;
  final int userId;
  final String documentPath;
  final bool isApproved;
  final int campaignId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CampaignDocumentEntity({
    required this.id,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.campaignId,
    required this.documentPath,
    required this.userId,
  });
}
