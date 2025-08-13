part of 'feed_post_cubit.dart';

abstract class FeedPostState extends Equatable {
  const FeedPostState();

  @override
  List<Object> get props => [];
}

class FeedPostInitial extends FeedPostState {}

class FeedPostLoading extends FeedPostState {}

class FeedPostLoaded extends FeedPostState {
  final List<PostEntity> posts;

  const FeedPostLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class FeedPostFailure extends FeedPostState {
  final String failure;

  const FeedPostFailure({required this.failure});
}

class FeedPostEmpty extends FeedPostState {}
