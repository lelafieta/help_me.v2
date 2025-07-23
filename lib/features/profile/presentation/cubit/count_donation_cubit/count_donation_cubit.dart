import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../campaigns/domain/usecases/get_count_my_donations_usecase.dart';

part 'count_donation_state.dart';

class CountDonationCubit extends Cubit<CountDonationState> {
  CountDonationCubit(super.initialState);
  // final GetCountMyDonationsUseCase getCountMyDonationsUseCase;
  // CountDonationCubit({required this.getCountMyDonationsUseCase}) : super(CountDonationInitial());

  // Future<void> counter() async {
  //   emit(CountDonationLoading());
  //   final failureOrCount = await getCountMyDonationsUseCase(NoParams());
  //   failureOrCount.fold(
  //     (failure) => emit(CountDonationError(message: failure.message)),
  //     (count) => emit(CountDonationLoaded(count: count)),
  //   );
  // }
}
