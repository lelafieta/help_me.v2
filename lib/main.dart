import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:help_me/features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:help_me/config/themes/themes.dart';
import 'package:help_me/config/themes/theme_cubit/theme_cubit.dart';
import 'package:help_me/features/home/presentation/cubit/urgent_campaign/urgent_campaign_cubit.dart';

import 'package:help_me/config/router/app_router.dart';
import 'package:help_me/features/auth/presentation/cubit/user_cubit.dart';
import 'package:help_me/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:help_me/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:help_me/features/profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import 'package:help_me/features/solidary/presentation/cubit/solidary_cubit.dart';
import 'package:help_me/features/campaigns/presentation/cubit/campaign_cubit.dart';

import 'features/campaigns/presentation/cubit/campaign_detail_cubit/campaign_detail_cubit.dart';
import 'features/categories/presentation/cubit/category_cubit.dart';
import 'features/favorites/presentation/cubit/favorite_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await dotenv.load(fileName: ".env");
  await di.init();
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..lineWidth = 2.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<UserCubit>()..loadUser()),
        BlocProvider(create: (context) => di.sl<ThemeCubit>()),
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<ProfileCubit>()),
        BlocProvider(create: (context) => di.sl<CountDonationCubit>()),
        BlocProvider(
          create: (context) => di.sl<CategoryCubit>()..getCategories(),
        ),
        BlocProvider(create: (context) => di.sl<SolidaryCubit>()),
        BlocProvider(create: (context) => di.sl<CampaignCubit>()),
        BlocProvider(create: (context) => di.sl<UrgentCampaignCubit>()),
        BlocProvider(create: (context) => di.sl<FavoriteCubit>()),
        BlocProvider(create: (context) => di.sl<CampaignDetailCubit>()),
        BlocProvider(create: (context) => di.sl<CampaignStoreFavoriteCubit>()),
        //

        //
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Help-me',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            // initialRoute: AppRouter.splashRoute,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
