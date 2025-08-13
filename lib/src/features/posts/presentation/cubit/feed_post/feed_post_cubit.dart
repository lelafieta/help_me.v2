import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/get_all_posts_usecase.dart';
part 'feed_post_state.dart';

class FeedPostCubit extends Cubit<FeedPostState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  FeedPostCubit({required this.getAllPostsUseCase}) : super(FeedPostInitial());

  Future<void> getAllPosts() async {
    emit(FeedPostLoading());
    final result = await getAllPostsUseCase(NoParams());
    result.fold(
      (failure) {
        emit(FeedPostFailure(failure: failure.errorMessage.toString()));
      },
      (posts) {
        if (posts.isEmpty) {
          emit(FeedPostEmpty());
        } else {
          emit(FeedPostLoaded(posts: posts));
        }
      },
    );
  }
}
