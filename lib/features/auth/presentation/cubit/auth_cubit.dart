import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/params/login_request_params.dart';
import '../../domain/usecases/clear_token_usecase.dart';
import '../../domain/usecases/clear_user_data_usecase.dart';
import '../../domain/usecases/get_token_usecase.dart';
import '../../domain/usecases/get_user_avatar_usecase.dart';
import '../../domain/usecases/get_user_name_usecase.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final GetTokenUseCase getTokenUseCase;
  final ClearTokenUseCase clearTokenUseCase;
  final GetUserNameUseCase getUserNameUseCase;
  final GetUserAvatarUseCase getUserAvatarUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.getTokenUseCase,
    required this.clearTokenUseCase,
    required this.getUserNameUseCase,
    required this.getUserAvatarUseCase,
    required this.clearUserDataUseCase,
  }) : super(AuthInitial());

  Future<void> login(LoginRequestParams params) async {
    emit(AuthLoading());
    final result = await loginUseCase(params);
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage.toString())),
      (authResponse) => emit(
        AuthAuthenticated(authResponse: authResponse, user: authResponse.user),
      ),
    );
  }

  // Future<void> checkAuthStatus() async {
  //   emit(AuthLoading());
  //   final tokenResult = await getTokenUseCase(NoParams());
  //   final firstNameResult = await getUserNameUseCase(NoParams());
  //   final avatarResult = await getUserAvatarUseCase(NoParams());

  //   tokenResult.fold(
  //     (failure) => emit(AuthError(message: failure.errorMessage.toString())),
  //     (token) {
  //       if (token != null) {
  //         firstNameResult.fold(
  //           (failure) => emit(AuthError(message: failure.errorMessage.toString())),
  //           (firstName) {
  //             avatarResult.fold(
  //               (failure) => emit(AuthError(message: failure.errorMessage.toString())),
  //               (avatar) {
  //                 emit(
  //                   AuthAuthenticated(
  //                     authResponse: AuthResponseDto(accessToken: token),
  //                     user: UserDto(
  //                       id: 0, // ID is not stored locally, placeholder
  //                       email: '', // Email is not stored locally, placeholder
  //                       firstName: firstName,
  //                       lastName: '', // Last name is not stored locally, placeholder
  //                       avatarUrl: avatar,
  //                     ),

  Future<void> logout() async {
    emit(AuthLoading());
    final tokenClearResult = await clearTokenUseCase(NoParams());
    final userDataClearResult = await clearUserDataUseCase(NoParams());

    if (tokenClearResult.isRight() && userDataClearResult.isRight()) {
      emit(AuthUnauthenticated());
    } else {
      emit(AuthError(message: 'Failed to clear user data.'));
    }
  }
}
