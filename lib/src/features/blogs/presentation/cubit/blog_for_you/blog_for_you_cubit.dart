import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/blog_entity.dart';
import '../../../domain/usecases/get_foryou_blogs_usecase.dart';

part 'blog_for_you_state.dart';

class BlogForYouCubit extends Cubit<BlogForYouState> {
  final GetForYouBlogsUseCase getForYouBlogsUseCase;

  BlogForYouCubit({required this.getForYouBlogsUseCase})
    : super(BlogForYouInitial());

  Future<void> getForYouBlogs() async {
    emit(BlogForYouLoading());
    final result = await getForYouBlogsUseCase(NoParams());

    result.fold(
      (failure) {
        emit(BlogForYouFailure(failure: failure.errorMessage.toString()));
      },
      (blogs) {
        emit(BlogForYouLoaded(blogs: blogs));
      },
    );
  }
}
