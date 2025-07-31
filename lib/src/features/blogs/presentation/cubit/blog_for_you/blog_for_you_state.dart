part of 'blog_for_you_cubit.dart';

abstract class BlogForYouState extends Equatable {
  const BlogForYouState();

  @override
  List<Object> get props => [];
}

class BlogForYouInitial extends BlogForYouState {}

class BlogForYouLoading extends BlogForYouState {}

class BlogForYouLoaded extends BlogForYouState {
  final List<BlogEntity> blogs;

  const BlogForYouLoaded({required this.blogs});
}

class BlogForYouFailure extends BlogForYouState {
  final String failure;

  const BlogForYouFailure({required this.failure});
}
