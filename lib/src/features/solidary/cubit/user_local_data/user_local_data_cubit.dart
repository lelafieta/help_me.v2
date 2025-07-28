import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/datasources/auth_local_data_source.dart';

part 'user_local_data_state.dart';

class UserLocalDataCubit extends Cubit<UserLocalDataState> {
  final IAuthLocalDataSource authLocalDataSource;
  UserLocalDataCubit({required this.authLocalDataSource})
    : super(UserLocalDataInitial());

  Future<void> loadUser() async {
    emit(UserLocalDataLoading());
    try {
      final firstName = await authLocalDataSource.getUserFirstName();
      final lastName = await authLocalDataSource.getUserLastName();
      final avatarUrl = await authLocalDataSource.getUserAvatar();
      emit(
        UserLocalDataLoaded(
          firstName: firstName,
          avatarUrl: avatarUrl,
          lastName: lastName,
        ),
      );
    } catch (e) {
      emit(UserLocalDataError(message: e.toString()));
    }
  }
}
