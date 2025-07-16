import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:help_me/core/network/network_info.dart';
import 'package:help_me/core/api/auth_interceptor.dart';
import 'package:help_me/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:help_me/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:help_me/features/auth/domain/repositories/auth_repository.dart';
import 'package:help_me/features/auth/domain/usecases/login_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/clear_token_usecase.dart';
import 'package:help_me/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:help_me/features/auth/domain/usecases/get_user_name_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/get_user_avatar_usecase.dart';
import 'package:help_me/features/auth/domain/usecases/clear_user_data_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Auth
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      getTokenUseCase: sl(),
      clearTokenUseCase: sl(),
      getUserNameUseCase: sl(),
      getUserAvatarUseCase: sl(),
      clearUserDataUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));
  sl.registerLazySingleton(() => ClearTokenUseCase(sl()));
  sl.registerLazySingleton(() => GetUserNameUseCase(sl()));
  sl.registerLazySingleton(() => GetUserAvatarUseCase(sl()));
  sl.registerLazySingleton(() => ClearUserDataUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final baseUrl = dotenv.env['BASE_URL'] ?? '';
  sl.registerLazySingleton(
    () =>
        Dio(BaseOptions(baseUrl: baseUrl))
          ..interceptors.add(sl<AuthInterceptor>()),
  );
  sl.registerLazySingleton(() => AuthInterceptor(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // External
}
