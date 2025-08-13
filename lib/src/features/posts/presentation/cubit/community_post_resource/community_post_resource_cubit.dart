import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/get_posts_with_resources_by_community_usecase.dart';

part 'community_post_resource_state.dart';

class CommunityPostResourceCubit extends Cubit<CommunityPostResourceState> {
  final GetPostsWithResourcesByCommunityUseCase
  getPostsWithResourcesByCommunityUseCase;

  CommunityPostResourceCubit({
    required this.getPostsWithResourcesByCommunityUseCase,
  }) : super(CommunityPostResourceInitial());

  Future<void> getPostsByCommunityId(String communityId) async {
    emit(CommunityPostResourceLoading());
    final result = await getPostsWithResourcesByCommunityUseCase(communityId);
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
