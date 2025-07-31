import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/get_posts_by_community_id_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostsByCommunityIdUseCase getPostsByCommunityIdUseCase;

  PostCubit({required this.getPostsByCommunityIdUseCase})
    : super(PostInitial());

  Future<void> getPostsByCommunityId(String communityId) async {
    emit(PostLoading());
    final result = await getPostsByCommunityIdUseCase(communityId);
    result.fold(
      (failure) => emit(PostFailure(failure: failure.errorMessage.toString())),
      (posts) => emit(PostLoaded(posts: posts)),
    );
  }
}
