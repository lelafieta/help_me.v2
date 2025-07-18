import '../../domain/entities/campaign_entity.dart';

class CampaignModel extends CampaignEntity {
  const CampaignModel({
    super.id,
    super.title,
    super.description,
    super.imageCoverUrl,
    super.mediaUrls,
    super.documentUrls,
    super.status,
    super.userId,
    super.categoryId,
    super.startDate,
    super.endDate,
    super.location,
    super.phoneNumber,
    super.fundraisingGoal,
    super.fundsRaised,
    super.beneficiaryName,
    super.campaignType,
    super.currency,
    super.birth,
    super.urgencyScore,
    super.createdAt,
    super.updatedAt,
    super.isActivate,
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
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      fundraisingGoal: (json['fundraisingGoal'] as num).toDouble(),
      fundsRaised: json['fundsRaised'] != null
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
      isActivate: json['isActivate'] ?? true,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isActivate': isActivate,
    };
  }
}
