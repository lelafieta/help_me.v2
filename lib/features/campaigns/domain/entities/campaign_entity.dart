import 'package:equatable/equatable.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../ongs/domain/ong_entity.dart';
import 'campaign_comment_entity.dart';
import 'campaign_contributor_entity.dart';
import 'campaign_document_entity.dart';
import 'campaign_midia_entity.dart';
import 'campaign_update_entity.dart';

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
  final bool isActivate;
  final String? beneficiaryName;
  final String? campaignType;
  final String? currency;
  final DateTime? birth;
  final double? fundraisingGoal;
  final double? fundsRaised;
  final int? numberOfContributions;
  final int? urgencyScore;
  final CategoryEntity category;
  final UserEntity user;
  final List<CampaignContributorEntity>? campaignContributor;
  final List<CampaignDocumentEntity>? campaignDocuments;
  final List<CampaignMidiaEntity>? campaignMidias;
  final List<CampaignUpdateEntity>? campaignUpdates;
  final List<CampaignCommentEntity>? campaignComments;
  final OngEntity? ong;

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
    required this.isActivate,
    required this.user,
    this.beneficiaryName,
    this.campaignType,
    this.currency,
    this.birth,
    required this.fundraisingGoal,
    required this.fundsRaised,
    this.numberOfContributions,
    this.urgencyScore,
    this.campaignContributor,
    required this.category,
    this.campaignDocuments,
    this.campaignComments,
    this.campaignMidias,
    this.campaignUpdates,
    this.ong,
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
    user,
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
    campaignContributor,
    category,
    campaignDocuments,
    campaignComments,
    campaignMidias,
    campaignUpdates,
    ong,
  ];
}
