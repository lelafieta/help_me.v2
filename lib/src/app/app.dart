import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:utueji/src/features/communities/presentation/cubit/member_community/community_member_cubit.dart';
import 'package:utueji/src/features/events/presentation/cubit/community_event/community_event_cubit.dart';
import 'package:utueji/src/features/ongs/presentation/cubit/ong_action_cubit/ong_action_cubit.dart';
import 'package:utueji/src/features/posts/presentation/cubit/community_post/community_post_cubit.dart';
import '../config/routes/app_pages.dart';
import '../config/themes/app_theme.dart';
import '../app/di.dart' as di;
import '../features/auth/presentation/cubit/auth_data/auth_data_cubit.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/auth/presentation/cubit/initial_cubit/initial_cubit.dart';
import '../features/blogs/presentation/cubit/blog_featured/blog_featured_cubit.dart';
import '../features/blogs/presentation/cubit/blog_for_you/blog_for_you_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_action_cubit/campaign_action_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_detail_cubit/campaign_detail_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import '../features/campaigns/presentation/cubit/campaign_urgent_cubit/campaign_urgent_cubit.dart';
import '../features/campaigns/presentation/cubit/category_campaign_cubit/category_campaign_cubit.dart';
import '../features/campaigns/presentation/cubit/my_campaign_cubit/my_campaign_cubit.dart';
import '../features/campaigns/presentation/cubit/my_campaign_detail_cubit/my_campaign_detail_cubit.dart';
import '../features/campaigns/presentation/cubit/update_action_cubit/update_action_cubit.dart';
import '../features/categories/presentation/cubit/category_cubit.dart';
import '../features/communities/presentation/cubit/community_cubit.dart';
import '../features/events/presentation/cubit/event_cubit.dart';
import '../features/favorites/presentation/cubit/favorite_cubit.dart';
import '../features/feeds/presentation/cubit/feed_cubit.dart';
import '../features/home/presentation/cubit/home_campaign_cubit/home_campaign_cubit.dart';
import '../features/home/presentation/cubit/home_profile_data_cubit/home_profile_data_cubit.dart';
import '../features/ongs/presentation/cubit/ong_cubit.dart';
import '../features/posts/presentation/cubit/community_post_resource/community_post_resource_cubit.dart';
import '../features/posts/presentation/cubit/feed_post/feed_post_cubit.dart';
import '../features/posts/presentation/cubit/post/post_cubit.dart';
import '../features/posts/presentation/widgets/post_widget.dart';
import '../features/profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import '../features/profile/presentation/cubit/profile_cubit.dart';
import '../features/solidary/cubit/solidary_cubit.dart';
import '../features/solidary/cubit/user_local_data/user_local_data_cubit.dart';

class UtuejiApp extends StatelessWidget {
  const UtuejiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<InitialCubit>()),
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
        BlocProvider(create: (_) => di.sl<EventCubit>()),
        BlocProvider(create: (_) => di.sl<OngCubit>()),
        BlocProvider(create: (_) => di.sl<FeedCubit>()),
        BlocProvider(create: (_) => di.sl<BlogFeaturedCubit>()),
        BlocProvider(create: (_) => di.sl<BlogForYouCubit>()),
        BlocProvider(create: (_) => di.sl<MyCampaignCubit>()),
        BlocProvider(create: (_) => di.sl<CampaignDetailCubit>()),
        BlocProvider(create: (_) => di.sl<HomeCampaignCubit>()),
        BlocProvider(create: (_) => di.sl<CampaignUrgentCubit>()),
        BlocProvider(create: (_) => di.sl<MyCampaignDetailCubit>()),
        BlocProvider(create: (_) => di.sl<CampaignStoreFavoriteCubit>()),
        BlocProvider(create: (_) => di.sl<FavoriteCubit>()),
        BlocProvider(create: (_) => di.sl<UpdateActionCubit>()),
        BlocProvider(create: (_) => di.sl<CampaignActionCubit>()),
        BlocProvider(create: (_) => di.sl<CategoryCampaignCubit>()),
        BlocProvider(
          create: (_) => di.sl<HomeProfileDataCubit>()..getUserProfile(),
        ),
        BlocProvider(create: (_) => di.sl<ProfileCubit>()..getProfile()),
        BlocProvider(create: (_) => di.sl<CountDonationCubit>()),
        BlocProvider(create: (_) => di.sl<SolidaryCubit>()),
        BlocProvider(create: (_) => di.sl<AuthDataCubit>()),
        BlocProvider(create: (_) => di.sl<OngActionCubit>()),
        BlocProvider(create: (_) => di.sl<CategoryCubit>()..getAllCategories()),
        BlocProvider(create: (_) => di.sl<UserLocalDataCubit>()..loadUser()),
        BlocProvider(create: (_) => di.sl<CommunityCubit>()),
        BlocProvider(create: (_) => di.sl<CommunityPostCubit>()),
        BlocProvider(create: (_) => di.sl<CommunityEventCubit>()),
        BlocProvider(create: (_) => di.sl<CommunityMemberCubit>()),
        BlocProvider(create: (_) => di.sl<CommunityPostResourceCubit>()),
        BlocProvider(create: (_) => di.sl<FeedPostCubit>()),
      ],
      child: GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.onGenerateRoute,
        navigatorKey: PostImagesGrid.navigatorKey,
        builder: EasyLoading.init(),
      ),
    );
  }
}
