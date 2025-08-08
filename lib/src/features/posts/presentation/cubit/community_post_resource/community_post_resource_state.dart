part of 'community_post_resource_cubit.dart';

abstract class CommunityPostResourceState extends Equatable {
  const CommunityPostResourceState();

  @override
  List<Object> get props => [];
}

class CommunityPostResourceInitial extends CommunityPostResourceState {}

class CommunityPostResourceLoading extends CommunityPostResourceState {}

class CommunityPostResourceLoaded extends CommunityPostResourceState {
  final List<PostEntity> posts;

  const CommunityPostResourceLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class CommunityPostResourceFailure extends CommunityPostResourceState {
  final String failure;

  const CommunityPostResourceFailure({required this.failure});
}

class CommunityPostResourceEmpty extends CommunityPostResourceState {}
