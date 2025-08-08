import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/community_member_entity.dart';
import '../../../domain/usecases/get_members_by_community_id_usecase.dart';

part 'community_member_state.dart';

class CommunityMemberCubit extends Cubit<CommunityMemberState> {
  final GetMembersByCommunityIdUseCase getMembersByCommunityIdUseCase;

  CommunityMemberCubit({required this.getMembersByCommunityIdUseCase})
    : super(CommunityMemberInitial());

  Future<void> getMembersByCommunityId(String communityId) async {
    emit(CommunityMemberLoading());
    final result = await getMembersByCommunityIdUseCase(communityId);
    result.fold(
      (failure) {
        emit(CommunityMemberFailure(failure: failure.errorMessage.toString()));
      },
      (members) {
        emit(CommunityMemberLoaded(members: members));
      },
    );
  }
}
