part of 'urgent_campaign_cubit.dart';

abstract class UrgentCampaignState extends Equatable {
  const UrgentCampaignState();

  @override
  List<Object> get props => [];
}

class UrgentCampaignInitial extends UrgentCampaignState {}

class UrgentCampaignLoading extends UrgentCampaignState {}

class UrgentCampaignLoaded extends UrgentCampaignState {
  final List<CampaignEntity> campaigns;

  const UrgentCampaignLoaded({required this.campaigns});

  @override
  List<Object> get props => [campaigns];
}

class UrgentCampaignError extends UrgentCampaignState {
  final String message;

  const UrgentCampaignError({required this.message});

  @override
  List<Object> get props => [message];
}
