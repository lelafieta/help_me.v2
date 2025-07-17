import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'solidary_state.dart';

class SolidaryCubit extends Cubit<SolidaryState> {
  SolidaryCubit() : super(SolidaryInitial());

  Future<void> getUserData() async {
    emit(SolidaryLoading());
    // Implement your user data fetching logic here
    await Future.delayed(const Duration(seconds: 1));
    emit(const SolidaryLoaded(message: 'User data loaded!'));
  }
}
