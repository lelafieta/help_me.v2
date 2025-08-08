part of 'community_event_cubit.dart';

abstract class CommunityEventState extends Equatable {
  const CommunityEventState();

  @override
  List<Object> get props => [];
}

class CommunityEventInitial extends CommunityEventState {}

class CommunityEventLoading extends CommunityEventState {}

class CommunityEventEmpty extends CommunityEventState {}

class CommunityEventLoaded extends CommunityEventState {
  final List<EventEntity> events;

  const CommunityEventLoaded({required this.events});

  @override
  List<Object> get props => [events];
}

class CommunityEventFailure extends CommunityEventState {
  final String failure;

  const CommunityEventFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
