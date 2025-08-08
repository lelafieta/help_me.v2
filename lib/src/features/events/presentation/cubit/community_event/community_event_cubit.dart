import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecases/get_events_by_community_id.dart';

part 'community_event_state.dart';

class CommunityEventCubit extends Cubit<CommunityEventState> {
  final GetEventsByCommunityIdUsecase getEventsByCommunityIdUsecase;

  CommunityEventCubit({required this.getEventsByCommunityIdUsecase})
    : super(CommunityEventInitial());

  Future<void> getPostsByCommunityId(String communityId) async {
    emit(CommunityEventLoading());
    final result = await getEventsByCommunityIdUsecase(communityId);

    result.fold(
      (failure) =>
          emit(CommunityEventFailure(failure: failure.errorMessage.toString())),
      (events) {
        if (events.isEmpty) {
          emit(CommunityEventEmpty());
        } else {
          emit(CommunityEventLoaded(events: events));
        }
      },
    );
  }
}
