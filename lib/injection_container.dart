import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:help_me/features/favorites/data/datasources/favorite_datasource.dart';
import 'package:help_me/features/favorites/data/datasources/i_favorite_datasource.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/api/auth_interceptor.dart';
import 'core/network/network_info.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/clear_token_usecase.dart';
import 'features/auth/domain/usecases/clear_user_data_usecase.dart';
import 'features/auth/domain/usecases/get_token_usecase.dart';
import 'features/auth/domain/usecases/get_user_avatar_usecase.dart';
import 'features/auth/domain/usecases/get_user_name_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/cubit/user_cubit.dart';
import 'features/campaigns/data/datasources/i_campaign_remote_data_source.dart';
import 'features/campaigns/data/datasources/campaign_remote_datasource.dart';
import 'features/campaigns/data/repositories/campaign_repository.dart';
import 'features/campaigns/domain/repositories/i_campaign_repository.dart';
import 'features/campaigns/domain/usecases/create_campaign_usecase.dart';
import 'features/campaigns/domain/usecases/delete_campaign_usecase.dart';
import 'features/campaigns/domain/usecases/get_all_campaigns_usecase.dart';
import 'features/campaigns/domain/usecases/get_campaign_by_id_usecase.dart';
import 'features/campaigns/domain/usecases/get_campaigns_by_category_id_usecase.dart';
import 'features/campaigns/domain/usecases/get_campaigns_by_user_id_usecase.dart';
import 'features/campaigns/domain/usecases/get_my_campaigns_by_status_usecase.dart';
import 'features/campaigns/domain/usecases/get_urgent_campaigns_smart_usecase.dart';
import 'features/campaigns/domain/usecases/update_campaign_usecase.dart';
import 'features/campaigns/presentation/cubit/campaign_cubit.dart';
import 'features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import 'features/categories/data/datasources/category_remote_data_source.dart';
import 'features/categories/data/datasources/category_remote_data_source_impl.dart';
import 'features/categories/data/repositories/category_repository_impl.dart';
import 'features/categories/domain/repositories/category_repository.dart';
import 'features/categories/domain/usecases/get_categories_usecase.dart';
import 'features/categories/presentation/cubit/category_cubit.dart';
import 'features/favorites/data/repositories/favorite_repository.dart';
import 'features/favorites/domain/repositories/i_favorite_repository.dart';
import 'features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'features/home/presentation/cubit/urgent_campaign/urgent_campaign_cubit.dart';
import 'features/profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/solidary/presentation/cubit/solidary_cubit.dart';

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

  // Features - Campaigns
  sl.registerFactory(
    () => CampaignCubit(
      createCampaignUseCase: sl(),
      getAllCampaignsUseCase: sl(),
      getCampaignsByUserIdUseCase: sl(),
      getCampaignByIdUseCase: sl(),
      getCampaignsByCategoryIdUseCase: sl(),
      getMyCampaignsByStatusUseCase: sl(),
      getUrgentCampaignsSmartUseCase: sl(),
      updateCampaignUseCase: sl(),
      deleteCampaignUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => UrgentCampaignCubit(getUrgentCampaignsSmartUseCase: sl()),
  );
  // Features - Profile
  sl.registerFactory(() => ProfileCubit());
  sl.registerFactory(() => CountDonationCubit());

  // Features - Solidary
  sl.registerFactory(() => SolidaryCubit());

  sl.registerFactory(
    () => CampaignStoreFavoriteCubit(
      addFavoriteUseCase: sl(),
      removeFavoriteUseCase: sl(),
    ),
  );

  // Features -

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserNameUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserAvatarUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearUserDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateCampaignUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllCampaignsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCampaignsByUserIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCampaignByIdUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => GetCampaignsByCategoryIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetMyCampaignsByStatusUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetUrgentCampaignsSmartUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => UpdateCampaignUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteCampaignUseCase(repository: sl()));

  sl.registerLazySingleton(() => AddFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(repository: sl()));

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
  sl.registerLazySingleton<ICampaignRepository>(
    () => CampaignRepository(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<IFavoriteRepository>(
    () => FavoriteRepository(networkInfo: sl(), favoriteDataSource: sl()),
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
  sl.registerLazySingleton<ICampaignRemoteDataSource>(
    () => CampaignRemoteDataSource(dio: sl()),
  );

  sl.registerLazySingleton<IFavoriteDataSource>(
    () => FavoriteDataSource(dio: sl()),
  );

  // Core
  sl.registerLazySingleton<INetworkInfo>(
    () => NetworkInfo(connectionChecker: sl()),
  );

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
