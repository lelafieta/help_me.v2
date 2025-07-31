import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_core/get_core.dart';

import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:utueji/src/core/api/dio_consumer.dart';
import 'package:utueji/src/features/events/domain/usecases/get_event_by_id_usecase.dart';
import 'package:utueji/src/features/favorites/domain/usecases/get_favorites_by_type_usecase.dart';
import 'package:utueji/src/features/ongs/domain/usecases/get_ong_by_id_usecase.dart';
import 'package:utueji/src/features/solidary/cubit/user_local_data/user_local_data_cubit.dart';

import '../core/cache/secure_storage.dart';
import '../core/network/i_network_info.dart';
import '../core/network/network_info.dart';
import '../features/auth/data/datasources/auth_datasource.dart';
import '../features/auth/data/datasources/auth_local_data_source.dart';
import '../features/auth/data/datasources/i_auth_datasource.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/domain/repositories/i_auth_repository.dart';
import '../features/auth/domain/usecases/clear_token_usecase.dart';
import '../features/auth/domain/usecases/clear_user_data_usecase.dart';
import '../features/auth/domain/usecases/get_auth_user_usecase.dart';
import '../features/auth/domain/usecases/get_token_usecase.dart';
import '../features/auth/domain/usecases/get_user_avatar_usecase.dart';
import '../features/auth/domain/usecases/get_user_name_usecase.dart';
import '../features/auth/domain/usecases/is_sign_in_usecase.dart';
import '../features/auth/domain/usecases/sign_in_usecase.dart';
import '../features/auth/domain/usecases/sign_in_with_otp_usecase.dart';
import '../features/auth/domain/usecases/sign_out_usecase.dart';
import '../features/auth/domain/usecases/sign_up_usecase.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/auth/presentation/cubit/auth_data/auth_data_cubit.dart';
import '../features/auth/presentation/cubit/initial_cubit/initial_cubit.dart';
import '../features/blogs/data/datasources/blog_datasource.dart';
import '../features/blogs/data/datasources/i_blog_datasource.dart';
import '../features/blogs/data/repositories/blog_repository.dart';
import '../features/blogs/domain/repositories/i_blog_repository.dart';
import '../features/blogs/domain/usecases/get_foryou_blogs_usecase.dart';
import '../features/blogs/domain/usecases/get_fatured_blogs_usecase.dart';
import '../features/blogs/presentation/cubit/blog_featured/blog_featured_cubit.dart';
import '../features/blogs/presentation/cubit/blog_for_you/blog_for_you_cubit.dart';
import '../features/campaigns/data/datasources/donation_datasource.dart';
import '../features/campaigns/data/datasources/i_campaign_datasource.dart';
import '../features/campaigns/data/datasources/campaign_datasource.dart';
import '../features/campaigns/data/datasources/i_donation_datasource.dart';
import '../features/campaigns/data/datasources/i_update_datasource.dart';
import '../features/campaigns/data/datasources/update_datasource.dart';
import '../features/campaigns/data/repositories/campaign_repository.dart';
import '../features/campaigns/data/repositories/donation_repository.dart';
import '../features/campaigns/data/repositories/update_repository.dart';
import '../features/campaigns/domain/repositories/i_campaign_repository.dart';
import '../features/campaigns/domain/repositories/i_donation_respository.dart';
import '../features/campaigns/domain/repositories/i_update_repository.dart';
import '../features/campaigns/domain/usecases/create_campaign_update_usecase.dart';
import '../features/campaigns/domain/usecases/create_campaign_usecase.dart';
import '../features/campaigns/domain/usecases/delete_campaign_update_usecase.dart';
import '../features/campaigns/domain/usecases/delete_campaign_usecase.dart';
import '../features/campaigns/domain/usecases/get_all_campaigns_usecase.dart';
import '../features/campaigns/domain/usecases/get_all_my_campaigns_usecase.dart';
import '../features/campaigns/domain/usecases/get_all_urgent_campaigns_usecase.dart';
import '../features/campaigns/domain/usecases/get_campaign_by_id_usecase.dart';
import '../features/campaigns/domain/usecases/get_count_my_donations_usecase.dart';
import '../features/campaigns/domain/usecases/get_latest_urgent_campaigns_usecase.dart';
import '../features/campaigns/domain/usecases/update_campaign_update_usecase.dart';
import '../features/campaigns/domain/usecases/update_campaign_usecase.dart';
import '../features/campaigns/presentation/cubit/campaign_action_cubit/campaign_action_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_detail_cubit/campaign_detail_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_urgent_cubit/campaign_urgent_cubit.dart';
import '../features/campaigns/presentation/cubit/category_campaign_cubit/category_campaign_cubit.dart';
import '../features/campaigns/presentation/cubit/my_campaign_cubit/my_campaign_cubit.dart';
import '../features/campaigns/presentation/cubit/my_campaign_detail_cubit/my_campaign_detail_cubit.dart';
import '../features/campaigns/presentation/cubit/update_action_cubit/update_action_cubit.dart';
import '../features/categories/data/datasources/category_datasource.dart';
import '../features/categories/data/datasources/i_category_datasource.dart';
import '../features/categories/data/repositories/category_repository.dart';
import '../features/categories/domain/repositories/i_category_repository.dart';
import '../features/categories/domain/usecases/get_all_categories_usecase.dart';
import '../features/categories/presentation/cubit/category_cubit.dart';
import '../features/communities/data/datasources/community_datasource.dart';
import '../features/communities/data/datasources/i_community_datasource.dart';
import '../features/communities/data/repositories/community_repository.dart';
import '../features/communities/domain/repositories/i_community_repository.dart';
import '../features/communities/domain/usecases/get_my_communities_usecase.dart';
import '../features/communities/presentation/cubit/community_cubit.dart';
import '../features/events/data/datasources/event_datasource.dart';
import '../features/events/data/datasources/i_event_datasource.dart';
import '../features/events/data/repositories/event_repository.dart';
import '../features/events/domain/repositories/i_event_repository.dart';
import '../features/events/domain/usecases/fetch_nearby_events_usecase.dart';
import '../features/events/presentation/cubit/event_cubit.dart';
import '../features/favorites/data/datasources/favorite_datasource.dart';
import '../features/favorites/data/datasources/i_favorite_datasource.dart';
import '../features/favorites/data/repositories/favorite_repository.dart';
import '../features/favorites/domain/repositories/i_favorite_repository.dart';
import '../features/favorites/domain/usecases/add_favorite_usecase.dart';
import '../features/favorites/domain/usecases/get_all_favorites_usecase.dart';
import '../features/favorites/domain/usecases/is_my_favorite_usecase.dart';
import '../features/favorites/domain/usecases/remove_favorite_usecase.dart';
import '../features/favorites/presentation/cubit/favorite_cubit.dart';
import '../features/feeds/data/datasources/feed_datasource.dart';
import '../features/feeds/data/datasources/i_feed_datasource.dart';
import '../features/feeds/data/repositories/feed_repository.dart';
import '../features/feeds/domain/repositories/i_feed_repository.dart';
import '../features/feeds/domain/usecases/get_feeds_usecase.dart';
import '../features/feeds/presentation/cubit/feed_cubit.dart';
import '../features/home/presentation/cubit/home_campaign_cubit/home_campaign_cubit.dart';
import '../features/home/presentation/cubit/home_profile_data_cubit/home_profile_data_cubit.dart';
import '../features/ongs/data/datasources/i_ong_datasource.dart';
import '../features/ongs/data/datasources/ong_datasource.dart';
import '../features/ongs/data/repositories/ong_repository.dart';
import '../features/ongs/domain/respositories/i_ong_repository.dart';
import '../features/ongs/domain/usecases/create_ong_usecase.dart';
import '../features/ongs/domain/usecases/get_populares_ongs_usecase.dart';
import '../features/ongs/presentation/cubit/ong_action_cubit/ong_action_cubit.dart';
import '../features/ongs/presentation/cubit/ong_cubit.dart';
import '../features/profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import '../features/profile/presentation/cubit/profile_cubit.dart';
import '../features/solidary/cubit/solidary_cubit.dart';
import '../features/users/data/repositories/user_repository.dart';
import '../features/users/domain/repositories/i_user_repository.dart';

GetIt sl = GetIt.instance;

Future init() async {
  final supabaseUrl = dotenv.env["SUPABASE_URL"];
  final supabaseKey = dotenv.env["SUPABASE_KEY"];

  await Supabase.initialize(url: supabaseUrl!, anonKey: supabaseKey!);
  _setUpExternal();
  _setUpCubits();
  _setUpUsecases();
  _setUpRepositories();
  _setUpDatasources();

  // Repositories
}

void _setUpExternal() async {
  Dio dio = createDio();
  // FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  sl.registerFactory<Dio>(() => dio);

  sl.registerFactory(() => Supabase.instance.client);
  sl.registerFactory(() => FirebaseFirestore.instance);
  // sl.registerFactory(() => GoogleSignIn());
  sl.registerFactory(() => FirebaseAuth.instance);
  sl.registerFactory(() => FirebaseStorage.instance);

  sl.registerLazySingleton<SecureCacheHelper>(() => SecureCacheHelper());
  sl.registerLazySingleton<INetWorkInfo>(
    () => NetWorkInfo(netWorkInfo: InternetConnection.createInstance()),
  );
}

void _setUpCubits() {
  sl.registerFactory(
    () => AuthCubit(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
      signInWithOtpUseCase: sl(),
      secureCacheHelper: sl(),
      getTokenUseCase: sl(),
      clearTokenUseCase: sl(),
      getUserNameUseCase: sl(),
      getUserAvatarUseCase: sl(),
      clearUserDataUseCase: sl(),
    ),
  );
  sl.registerFactory(() => InitialCubit(isSignInUseCase: sl()));
  sl.registerFactory(
    () => HomeCampaignCubit(getLatestUrgentCampaignsUseCase: sl()),
  );
  sl.registerFactory(
    () => CampaignUrgentCubit(getUrgentCampaignsUseCase: sl()),
  );

  sl.registerFactory(() => EventCubit(getNearbyEventsUsecase: sl()));
  sl.registerFactory(() => OngCubit(getPopularesOngsUseCase: sl()));
  sl.registerFactory(() => FeedCubit(getFeedsUseCase: sl()));
  sl.registerFactory(() => BlogFeaturedCubit(getFeaturedBlogsUseCase: sl()));
  sl.registerFactory(() => BlogForYouCubit(getForYouBlogsUseCase: sl()));

  sl.registerFactory(() => CampaignDetailCubit(getCampaignByIdUseCase: sl()));

  sl.registerFactory(
    () => CampaignStoreFavoriteCubit(
      addFavoriteUsecase: sl(),
      removeFavoriteUsecase: sl(),
      getAllFavoritesUsecase: sl(),
      getFavoritesByTypeUseCase: sl(),
      isMyFavoriteUsecase: sl(),
    ),
  );

  sl.registerFactory(
    () => FavoriteCubit(
      addFavoriteUsecase: sl(),
      removeFavoriteUsecase: sl(),
      isMyFavoriteUsecase: sl(),
      getAllFavoritesUsecase: sl(),
      getFavoritesByTypeUseCase: sl(),
    ),
  );
  sl.registerFactory(() => MyCampaignCubit(getAllMyCampaignsUseCase: sl()));
  sl.registerFactory(
    () => MyCampaignDetailCubit(getMyCampaignByIdUseCase: sl()),
  );
  sl.registerFactory(
    () => UpdateActionCubit(
      createCampaignUpdateUseCase: sl(),
      updateCampaignUpdateUseCase: sl(),
      deleteCampaignUpdateUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CampaignActionCubit(
      createCampaignUseCase: sl(),
      updateCampaignUseCase: sl(),
    ),
  );
  sl.registerFactory(() => CategoryCampaignCubit(getAllCampaignsUseCase: sl()));
  sl.registerFactory(() => HomeProfileDataCubit(getAuthUserUseCase: sl()));
  sl.registerFactory(() => ProfileCubit(getAuthUserUseCase: sl()));

  sl.registerFactory(
    () => CountDonationCubit(getCountMyDonationsUseCase: sl()),
  );

  sl.registerFactory(() => SolidaryCubit(getAuthUserUseCase: sl()));
  sl.registerFactory(() => AuthDataCubit(getAuthUserUseCase: sl()));
  sl.registerFactory(() => OngActionCubit(createOngUseCase: sl()));

  sl.registerFactory(() => CategoryCubit(getAllCategoriesUsecase: sl()));
  sl.registerFactory(() => UserLocalDataCubit(authLocalDataSource: sl()));

  sl.registerFactory(() => CommunityCubit(getMyCommunitiesUseCase: sl()));
}

void _setUpUsecases() {
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(repository: sl()),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(repository: sl()),
  );
  sl.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(repository: sl()),
  );
  sl.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(repository: sl()),
  );
  sl.registerLazySingleton<SignInWithOtpUseCase>(
    () => SignInWithOtpUseCase(repository: sl()),
  );

  sl.registerLazySingleton(() => GetTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserNameUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserAvatarUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearUserDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateCampaignUseCase(repository: sl()));

  sl.registerLazySingleton(() => DeleteCampaignUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllCampaignsUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => GetAllUrgentCampaignsUseCase(repository: sl()),
  );

  sl.registerLazySingleton<UpdateCampaignUseCase>(
    () => UpdateCampaignUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetLatestUrgentCampaignsUseCase>(
    () => GetLatestUrgentCampaignsUseCase(repository: sl()),
  );
  sl.registerLazySingleton<GetNearbyEventsUsecase>(
    () => GetNearbyEventsUsecase(repository: sl()),
  );

  sl.registerLazySingleton<GetEventByUsecase>(
    () => GetEventByUsecase(repository: sl()),
  );

  sl.registerLazySingleton(() => GetPopularesOngsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetOngByIdUsecase(repository: sl()));
  sl.registerLazySingleton<GetFeedsUseCase>(
    () => GetFeedsUseCase(repository: sl()),
  );

  sl.registerLazySingleton(() => GetFeaturedBlogsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetForYouBlogsUseCase(repository: sl()));

  sl.registerLazySingleton<GetCampaignByIdUseCase>(
    () => GetCampaignByIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton<GetAllMyCampaignsUseCase>(
    () => GetAllMyCampaignsUseCase(repository: sl()),
  );

  sl.registerLazySingleton(() => IsMyFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllFavoritesUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetFavoritesByTypeUseCase(repository: sl()));

  sl.registerLazySingleton<CreateCampaignUpdateUseCase>(
    () => CreateCampaignUpdateUseCase(repository: sl()),
  );
  sl.registerLazySingleton<UpdateCampaignUpdateUseCase>(
    () => UpdateCampaignUpdateUseCase(repository: sl()),
  );
  sl.registerLazySingleton<DeleteCampaignUpdateUseCase>(
    () => DeleteCampaignUpdateUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetAuthUserUseCase>(
    () => GetAuthUserUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetCountMyDonationsUseCase>(
    () => GetCountMyDonationsUseCase(repository: sl()),
  );

  sl.registerLazySingleton<CreateOngUseCase>(
    () => CreateOngUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetAllCategoriesUsecase>(
    () => GetAllCategoriesUsecase(repository: sl()),
  );

  sl.registerLazySingleton(() => GetMyCommunitiesUseCase(repository: sl()));
}

void _setUpRepositories() {
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRespository(
      netWorkInfo: sl(),
      authDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ICampaignRepository>(
    () => CampaignRepository(campaignDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<IEventRepository>(
    () => EventRepository(netWorkInfo: sl(), eventDataSource: sl()),
  );
  sl.registerLazySingleton<IOngRepository>(
    () => OngRepository(ongDataSource: sl(), netWorkInfo: sl()),
  );
  sl.registerLazySingleton<IFeedRepository>(
    () => FeedRepository(feedDataSource: sl(), netWorkInfo: sl()),
  );
  sl.registerLazySingleton<IBlogRepository>(
    () => BlogRepository(blogDataSource: sl(), netWorkInfo: sl()),
  );
  sl.registerLazySingleton<IFavoriteRepository>(
    () => FavoriteRepository(favoriteDataSource: sl(), netWorkInfo: sl()),
  );
  sl.registerLazySingleton<IUpdateRepository>(
    () => UpdateRepository(datasource: sl(), netWorkInfo: sl()),
  );

  sl.registerLazySingleton<IUserRepository>(
    () => UserRespository(datasource: sl()),
  );

  sl.registerLazySingleton<IDonationRepository>(
    () => DonationRepository(datasource: sl()),
  );

  sl.registerLazySingleton<ICategoryRepository>(
    () => CategoryRepository(netWorkInfo: sl(), categoryDataSource: sl()),
  );
  sl.registerLazySingleton<ICommunityRepository>(
    () => CommunityRepository(netWorkInfo: sl(), communityDataSource: sl()),
  );
}

void _setUpDatasources() {
  sl.registerLazySingleton<IAuthDataSource>(
    () => AuthDataSource(supabase: sl(), dio: sl()),
  );
  sl.registerLazySingleton<ICampaignRemoteDataSource>(
    () => CampaignRemoteDataSource(supabase: sl(), dio: sl()),
  );
  sl.registerLazySingleton<IEventDataSource>(() => EventDataSource(dio: sl()));
  sl.registerLazySingleton<IOngDataSource>(() => OngDataSource(dio: sl()));
  sl.registerLazySingleton<IFeedDataSource>(() => FeedDataSource(dio: sl()));

  sl.registerLazySingleton<IBlogDataSource>(() => BlogDataSource(dio: sl()));

  sl.registerLazySingleton<IFavoriteDataSource>(
    () => FavoriteDataSource(dio: sl()),
  );

  sl.registerLazySingleton<IUpdateDataSource>(
    () => UpdateDataSource(supabase: sl()),
  );

  sl.registerLazySingleton<IDonationDataSource>(
    () => DonationDataSource(supabase: sl()),
  );

  sl.registerLazySingleton<IAuthLocalDataSource>(
    () => AuthLocalDataSource(secureStorage: sl()),
  );

  sl.registerLazySingleton<ICategoryDataSource>(
    () => CategoryDataSource(dio: sl()),
  );

  sl.registerLazySingleton<ICommunityDataSource>(
    () => CommunityDataSource(dio: sl()),
  );
}
