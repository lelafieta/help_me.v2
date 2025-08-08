part of 'community_post_cubit.dart';

abstract class CommunityPostState extends Equatable {
  const CommunityPostState();

  @override
  List<Object> get props => [];
}

class CommunityPostInitial extends CommunityPostState {}

class CommunityPostLoading extends CommunityPostState {}

class CommunityPostLoaded extends CommunityPostState {
  final List<PostEntity> posts;

  const CommunityPostLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class CommunityPostFailure extends CommunityPostState {
  final String failure;

  const CommunityPostFailure({required this.failure});
}

class CommunityPostEmpty extends CommunityPostState {}
