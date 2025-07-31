import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/blog_entity.dart';
import '../../../domain/usecases/get_fatured_blogs_usecase.dart';

part 'blog_featured_state.dart';

class BlogFeaturedCubit extends Cubit<BlogFeaturedState> {
  final GetFeaturedBlogsUseCase getFeaturedBlogsUseCase;

  BlogFeaturedCubit({required this.getFeaturedBlogsUseCase})
    : super(BlogFeaturedInitial());

  Future<void> getFeaturedBlogs() async {
    final result = await getFeaturedBlogsUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(BlogFeaturedFailure(failure: failure.errorMessage.toString())),
      (blogs) => emit(BlogFeaturedLoaded(blogs: blogs)),
    );
  }
}
