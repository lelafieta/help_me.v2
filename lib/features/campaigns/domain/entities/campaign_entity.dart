import 'package:equatable/equatable.dart';

class CampaignEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageCoverUrl;
  final List<String> mediaUrls;
  final List<String> documentUrls;
  final String status;
  final int userId;
  final int? categoryId;
  final String location;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isActivate;
  final String? beneficiaryName;
  final String? campaignType;
  final String currency;
  final DateTime? birth;
  final double? fundraisingGoal;
  final double? fundsRaised;
  final int? numberOfContributions;
  final int? urgencyScore;

  const CampaignEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageCoverUrl,
    required this.mediaUrls,
    required this.documentUrls,
    required this.status,
    required this.userId,
    required this.categoryId,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.isActivate,
    required this.currency,
    this.phoneNumber,
    this.startDate,
    this.endDate,
    this.beneficiaryName,
    this.campaignType,
    this.birth,
    this.fundraisingGoal,
    this.fundsRaised,
    this.numberOfContributions,
    this.urgencyScore,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageCoverUrl,
    mediaUrls,
    documentUrls,
    status,
    userId,
    categoryId,
    location,
    phoneNumber,
    createdAt,
    updatedAt,
    startDate,
    endDate,
    isActivate,
    beneficiaryName,
    campaignType,
    currency,
    birth,
    fundraisingGoal,
    fundsRaised,
    numberOfContributions,
    urgencyScore,
  ];
}
