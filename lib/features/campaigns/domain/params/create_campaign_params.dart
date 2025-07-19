class CreateCampaignParams {
  final String? title;
  final String? description;
  final double? fundraisingGoal;
  final String? imageCoverUrl;
  final String? institution;
  final String? location;
  final int? numberOfContributions;
  final int? ongId;
  final String? phoneNumber;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? userId;
  final bool? isActivate;
  final String? beneficiaryName;
  final String? campaignType;
  final String currency;
  final DateTime? birth;
  final String status;
  final int? categoryId;
  final List<String>? mediaUrls;
  final List<String>? documentUrls;

  CreateCampaignParams({
    this.title,
    this.description,
    this.fundraisingGoal,
    this.imageCoverUrl,
    this.institution,
    this.location,
    this.numberOfContributions,
    this.ongId,
    this.phoneNumber,
    this.startDate,
    this.endDate,
    this.userId,
    this.isActivate,
    this.beneficiaryName,
    this.campaignType,
    this.currency = "AOA",
    this.birth,
    this.status = "active",
    this.categoryId,
    this.mediaUrls,
    this.documentUrls,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'fundraisingGoal': fundraisingGoal,
    'imageCoverUrl': imageCoverUrl,
    'institution': institution,
    'location': location,
    'numberOfContributions': numberOfContributions,
    'ongId': ongId,
    'phoneNumber': phoneNumber,
    'startDate': startDate?.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
    'userId': userId,
    'isActivate': isActivate,
    'beneficiaryName': beneficiaryName,
    'campaignType': campaignType,
    'currency': currency,
    'birth': birth?.toIso8601String(),
    'status': status,
    'categoryId': categoryId,
    'mediaUrls': mediaUrls,
    'documentUrls': documentUrls,
  };
}
