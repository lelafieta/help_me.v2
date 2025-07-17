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
import 'package:help_me/features/auth/presentation/cubit/user_cubit.dart';
import 'package:help_me/features/category/data/datasources/category_remote_data_source.dart';
import 'package:help_me/features/category/data/datasources/category_remote_data_source_impl.dart';
import 'package:help_me/features/category/data/repositories/category_repository_impl.dart';
import 'package:help_me/features/category/domain/repositories/category_repository.dart';
import 'package:help_me/features/category/domain/usecases/get_categories_usecase.dart';
import 'package:help_me/features/category/presentation/cubit/category_cubit.dart';
import 'package:help_me/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:help_me/features/profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import 'package:help_me/features/solidary/presentation/cubit/solidary_cubit.dart';

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
  sl.registerFactory(() => UserCubit(authLocalDataSource: sl()));

  // Features - Category
  sl.registerFactory(() => CategoryCubit(getCategoriesUseCase: sl()));

  // Features - Profile
  sl.registerFactory(() => ProfileCubit());
  sl.registerFactory(() => CountDonationCubit());

  // Features - Solidary
  sl.registerFactory(() => SolidaryCubit());

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));
  sl.registerLazySingleton(() => ClearTokenUseCase(sl()));
  sl.registerLazySingleton(() => GetUserNameUseCase(sl()));
  sl.registerLazySingleton(() => GetUserAvatarUseCase(sl()));
  sl.registerLazySingleton(() => ClearUserDataUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(dio: sl()),
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
