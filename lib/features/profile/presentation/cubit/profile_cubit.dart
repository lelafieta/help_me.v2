import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    // Implement your profile fetching logic here
    await Future.delayed(const Duration(seconds: 1));
    emit(const ProfileLoaded(message: 'Profile loaded!'));
  }
}
