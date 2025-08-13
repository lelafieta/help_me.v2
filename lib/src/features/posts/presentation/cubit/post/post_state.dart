part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;

  const PostLoaded({required this.posts});
}

class PostFailure extends PostState {
  final String failure;

  const PostFailure({required this.failure});
}
