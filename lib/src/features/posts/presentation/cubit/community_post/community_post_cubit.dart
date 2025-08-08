import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/get_posts_by_community_id_usecase.dart';

part 'community_post_state.dart';

class CommunityPostCubit extends Cubit<CommunityPostState> {
  final GetPostsByCommunityIdUseCase getPostsByCommunityIdUseCase;

  CommunityPostCubit({required this.getPostsByCommunityIdUseCase})
    : super(CommunityPostInitial());

  Future<void> getPostsByCommunityId(String communityId) async {
    emit(CommunityPostLoading());
    final result = await getPostsByCommunityIdUseCase(communityId);
    result.fold(
      (failure) {
        emit(CommunityPostFailure(failure: failure.errorMessage.toString()));
      },
      (posts) {
        if (posts.isEmpty) {
          emit(CommunityPostEmpty());
        } else {
          emit(CommunityPostLoaded(posts: posts));
        }
      },
    );
  }
}
