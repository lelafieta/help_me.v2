
part of 'campaign_cubit.dart';

abstract class CampaignState extends Equatable {
  const CampaignState();

  @override
  List<Object> get props => [];
}

class CampaignInitial extends CampaignState {}

class CampaignLoading extends CampaignState {}

class CampaignLoaded extends CampaignState {
  final List<CampaignEntity> campaigns;

  const CampaignLoaded({required this.campaigns});

  @override
  List<Object> get props => [campaigns];
}

class CampaignDetailLoaded extends CampaignState {
  final CampaignEntity campaign;

  const CampaignDetailLoaded({required this.campaign});

  @override
  List<Object> get props => [campaign];
}

class CampaignCreated extends CampaignState {
  final CampaignEntity campaign;

  const CampaignCreated({required this.campaign});

  @override
  List<Object> get props => [campaign];
}

class CampaignUpdated extends CampaignState {
  final CampaignEntity campaign;

  const CampaignUpdated({required this.campaign});

  @override
  List<Object> get props => [campaign];
}

class CampaignDeleted extends CampaignState {}

class CampaignError extends CampaignState {
  final String message;

  const CampaignError({required this.message});

  @override
  List<Object> get props => [message];
}
