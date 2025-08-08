part of 'my_campaign_cubit.dart';

sealed class MyCampaignState extends Equatable {
  const MyCampaignState();

  @override
  List<Object> get props => [];
}

final class MyCampaignInitial extends MyCampaignState {}

final class MyCampaignLoading extends MyCampaignState {}

final class MyCampaignEmpty extends MyCampaignState {}

final class MyCampaignLoaded extends MyCampaignState {
  final List<CampaignEntity> campaigns;

  const MyCampaignLoaded({required this.campaigns});

  @override
  List<Object> get props => [campaigns];
}

final class MyCampaignFailure extends MyCampaignState {
  final String failure;

  const MyCampaignFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
