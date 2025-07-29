import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utueji/src/core/entities/no_params.dart';
import '../../domain/usecases/fetch_nearby_events_usecase.dart';
import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final GetNearbyEventsUsecase getNearbyEventsUsecase;
  EventCubit({required this.getNearbyEventsUsecase}) : super(EventInitial());

  Future<void> getNearbyEvents() async {
    emit(EventLoading());
    final result = await getNearbyEventsUsecase(NoParams());

    result.fold(
      (failure) => emit(EventFailure(failure: failure.errorMessage.toString())),
      (events) => emit(EventLoaded(events: events)),
    );
  }
}
