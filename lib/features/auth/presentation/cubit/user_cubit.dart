import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/features/auth/data/datasources/auth_local_data_source.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthLocalDataSource authLocalDataSource;

  UserCubit({required this.authLocalDataSource}) : super(UserInitial());

  Future<void> loadUser() async {
    emit(UserLoading());
    try {
      final firstName = await authLocalDataSource.getUserFirstName();
      final lastName = await authLocalDataSource.getUserLastName();
      final avatarUrl = await authLocalDataSource.getUserAvatar();
      emit(
        UserLoaded(
          firstName: firstName,
          avatarUrl: avatarUrl,
          lastName: lastName,
        ),
      );
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
