import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_donation_state.dart';

class CountDonationCubit extends Cubit<CountDonationState> {
  CountDonationCubit() : super(CountDonationInitial());

  Future<void> counter() async {
    emit(CountDonationLoading());
    // Implement your donation count logic here
    await Future.delayed(const Duration(seconds: 1));
    emit(const CountDonationLoaded(count: 0));
  }
}
