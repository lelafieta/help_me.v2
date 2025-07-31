part of 'blog_featured_cubit.dart';

abstract class BlogFeaturedState extends Equatable {
  const BlogFeaturedState();

  @override
  List<Object> get props => [];
}

class BlogFeaturedInitial extends BlogFeaturedState {}

class BlogFeaturedLoading extends BlogFeaturedState {}

class BlogFeaturedLoaded extends BlogFeaturedState {
  final List<BlogEntity> blogs;

  const BlogFeaturedLoaded({required this.blogs});
}

class BlogFeaturedFailure extends BlogFeaturedState {
  final String failure;

  const BlogFeaturedFailure({required this.failure});
}