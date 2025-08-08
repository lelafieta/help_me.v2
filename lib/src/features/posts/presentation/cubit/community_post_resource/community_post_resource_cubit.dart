import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utueji/src/features/posts/domain/usecases/get_posts_with_resources_by_community_id_usecase.dart';

import '../../../domain/entities/post_entity.dart';

part 'community_post_resource_state.dart';

class CommunityPostResourceCubit extends Cubit<CommunityPostResourceState> {
  final GetPostsWithResourcesByCommunityIdUseCase
  getPostsWithResourcesByCommunityIdUseCase;

  CommunityPostResourceCubit({
    required this.getPostsWithResourcesByCommunityIdUseCase,
  }) : super(CommunityPostResourceInitial());

  Future<void> getPostsByCommunityId(String communityId) async {
    emit(CommunityPostResourceLoading());
    final result = await getPostsWithResourcesByCommunityIdUseCase(communityId);
    result.fold(
      (failure) {
        emit(
          CommunityPostResourceFailure(
            failure: failure.errorMessage.toString(),
          ),
        );
      },
      (posts) {
        if (posts.isEmpty) {
          emit(CommunityPostResourceEmpty());
        } else {
          emit(CommunityPostResourceLoaded(posts: posts));
        }
      },
    );
  }
}
