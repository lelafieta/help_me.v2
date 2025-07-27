import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cache/secure_storage.dart';
import '../../../../core/entities/no_params.dart';
import '../../domain/entities/login_parameters.dart';
import '../../domain/usecases/clear_token_usecase.dart';
import '../../domain/usecases/clear_user_data_usecase.dart';
import '../../domain/usecases/get_token_usecase.dart';
import '../../domain/usecases/get_user_avatar_usecase.dart';
import '../../domain/usecases/get_user_name_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_in_with_otp_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../params/login_request_params.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final SignInWithOtpUseCase signInWithOtpUseCase;
  final SecureCacheHelper secureCacheHelper;
  final GetTokenUseCase getTokenUseCase;
  final ClearTokenUseCase clearTokenUseCase;
  final GetUserNameUseCase getUserNameUseCase;
  final GetUserAvatarUseCase getUserAvatarUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.secureCacheHelper,
    required this.signInWithOtpUseCase,
    required this.getTokenUseCase,
    required this.clearTokenUseCase,
    required this.getUserNameUseCase,
    required this.getUserAvatarUseCase,
    required this.clearUserDataUseCase,
  }) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final response = await signInUseCase.call(
      LoginRequestParams(email: email, password: password),
    );

    response.fold(
      (failure) => emit(AuthFailure(failure: failure.errorMessage.toString())),
      (authResponse) async {
        emit(Authenticated(authResponse: authResponse));
      },
    );
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    final response = await signOutUseCase.call(NoParams());

    response.fold(
      (failure) => emit(AuthFailure(failure: failure.errorMessage.toString())),
      (user) {
        secureCacheHelper.saveData(key: "uid", value: "");
        emit(AuthSignedOut());
      },
    );
  }

  Future<void> signInWithOtp(String phone) async {
    emit(AuthLoading());
    final response = await signInWithOtpUseCase.call(
      LoginParameters(phone: phone),
    );

    response.fold(
      (failure) => emit(AuthFailure(failure: failure.errorMessage.toString())),
      (user) {
        // secureCacheHelper.saveData(key: "uid", value: "");
        emit(AuthOtpSendSms());
      },
    );
  }
}
