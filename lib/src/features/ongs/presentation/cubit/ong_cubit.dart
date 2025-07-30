import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utueji/src/core/entities/no_params.dart';

import '../../domain/usecases/get_populares_ongs_usecase.dart';
import 'ong_state.dart';

class OngCubit extends Cubit<OngState> {
  final GetPopularesOngsUsecase getPopularesOngsUseCase;
  OngCubit({required this.getPopularesOngsUseCase}) : super(OngInitial());

  Future<void> getLatestOngs() async {
    emit(OngLoading());

    final result = await getPopularesOngsUseCase(const NoParams());
    result.fold(
      (failure) => emit(OngFailure(failure: failure.errorMessage.toString())),
      (ongs) => emit(OngLoaded(ongs: ongs)),
    );
  }
}
