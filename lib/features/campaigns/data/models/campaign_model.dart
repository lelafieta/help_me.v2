import '../../domain/entities/campaign_entity.dart';

class CampaignModel extends CampaignEntity {
  const CampaignModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageCoverUrl,
    required super.mediaUrls,
    required super.documentUrls,
    required super.status,
    required super.userId,
    required super.categoryId,
    required super.startDate,
    required super.endDate,
    required super.location,
    required super.phoneNumber,
    required super.fundraisingGoal,
    required super.currency,
    super.fundsRaised,
    super.beneficiaryName,
    super.campaignType,
    super.birth,
    super.urgencyScore,
    required super.createdAt,
    required super.updatedAt,
    required super.isActivate,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageCoverUrl: json['imageCoverUrl'],
      mediaUrls: List<String>.from(json['mediaUrls'] ?? []),
      documentUrls: List<String>.from(json['documentUrls'] ?? []),
      status: json['status'],
      userId: json['userId'],
      categoryId: json['categoryId'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      fundraisingGoal: (json['fundraisingGoal'] as num).toDouble(),
      fundsRaised: json['fundsRaised'] != null && json['fundsRaised'] is num
          ? (json['fundsRaised'] as num).toDouble()
          : null,
      beneficiaryName: json['beneficiaryName'],
      campaignType: json['campaignType'],
      currency: json['currency'],
      birth: json['birth'] != null ? DateTime.parse(json['birth']) : null,
      urgencyScore: json['urgencyScore'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),

      isActivate: json['isActivate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageCoverUrl': imageCoverUrl,
      'mediaUrls': mediaUrls,
      'documentUrls': documentUrls,
      'status': status,
      'userId': userId,
      'categoryId': categoryId,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'location': location,
      'phoneNumber': phoneNumber,
      'fundraisingGoal': fundraisingGoal,
      'fundsRaised': fundsRaised,
      'beneficiaryName': beneficiaryName,
      'campaignType': campaignType,
      'currency': currency,
      'birth': birth?.toIso8601String(),
      'urgencyScore': urgencyScore,
    };
  }
}
