import 'package:equatable/equatable.dart';

class CampaignEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageCoverUrl;
  final List<String>? mediaUrls;
  final List<String>? documentUrls;
  final String? status;
  final int? userId;
  final int? categoryId;
  final String? location;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isActivate;
  final String? beneficiaryName;
  final String? campaignType;
  final String? currency;
  final DateTime? birth;
  final double? fundraisingGoal;
  final double? fundsRaised;
  final int? numberOfContributions;
  final int? urgencyScore;

  const CampaignEntity({
    this.id,
    this.title,
    this.description,
    this.imageCoverUrl,
    this.mediaUrls,
    this.documentUrls,
    this.status,
    this.userId,
    this.categoryId,
    this.location,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.startDate,
    this.endDate,
    this.isActivate,
    this.beneficiaryName,
    this.campaignType,
    this.currency,
    this.birth,
    this.fundraisingGoal,
    this.fundsRaised,
    this.numberOfContributions,
    this.urgencyScore,
  });

  @override
  List<Object?> get props => [
    id ?? 0,
    title ?? '',
    description ?? '',
    imageCoverUrl ?? '',
    mediaUrls ?? [],
    documentUrls ?? [],
    status ?? '',
    userId ?? 0,
    categoryId ?? 0,
    location ?? '',
    phoneNumber ?? '',
    createdAt,
    updatedAt,
    startDate,
    endDate,
    isActivate ?? false,
    beneficiaryName ?? '',
    campaignType ?? '',
    currency ?? '',
    birth,
    fundraisingGoal ?? 0.0,
    fundsRaised ?? 0.0,
    numberOfContributions ?? 0,
    urgencyScore ?? 0,
  ];
}
