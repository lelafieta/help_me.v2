import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/no_params.dart';
import '../../domain/entities/community_entity.dart';
import '../../domain/usecases/get_my_communities_usecase.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final GetMyCommunitiesUseCase getMyCommunitiesUseCase;
  CommunityCubit({required this.getMyCommunitiesUseCase})
    : super(CommunityInitial());

  Future<void> getMyCommunities() async {
    emit(CommunityLoading());
    final result = await getMyCommunitiesUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(CommunityError(failure: failure.errorMessage.toString())),
      (communities) => emit(CommunityLoaded(communities: communities)),
    );
  }
}
