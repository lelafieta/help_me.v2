import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/auth/data/models/auth_dto.dart';
import 'package:help_me/features/auth/domain/usecases/login_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/clear_token_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final GetTokenUseCase getTokenUseCase;
  final ClearTokenUseCase clearTokenUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.getTokenUseCase,
    required this.clearTokenUseCase,
  }) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await loginUseCase(
      LoginParams(
        loginRequest: LoginRequestDto(email: email, password: password),
      ),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage.toString())),
      (authResponse) => emit(AuthAuthenticated(authResponse: authResponse)),
    );
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    final result = await getTokenUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage.toString())),
      (token) {
        if (token != null) {
          emit(
            AuthAuthenticated(
              authResponse: AuthResponseDto(accessToken: token),
            ),
          ); // Placeholder UserDto
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await clearTokenUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage.toString())),
      (_) => emit(AuthUnauthenticated()),
    );
  }
}
