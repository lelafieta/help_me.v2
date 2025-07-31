import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/no_params.dart';
import '../../domain/usecases/get_feeds_usecase.dart';
import 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final GetFeedsUseCase getFeedsUseCase;

  FeedCubit({required this.getFeedsUseCase}) : super(FeedInitial());

  Future<void> getFeeds() async {
    emit(FeedLoading());

    final result = await getFeedsUseCase(const NoParams());

    result.fold(
      (failure) => emit(FeedFailure(failure: failure.errorMessage.toString())),
      (feeds) => emit(FeedLoaded(feeds: feeds)),
    );
  }
}
