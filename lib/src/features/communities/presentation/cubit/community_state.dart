part of 'community_cubit.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityLoaded extends CommunityState {
  final List<CommunityEntity> communities;

  const CommunityLoaded({required this.communities});

  @override
  List<Object> get props => [communities];
}

class CommunityError extends CommunityState {
  final String failure;

  const CommunityError({required this.failure});

  @override
  List<Object> get props => [failure];
}
