import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../features/campaigns/domain/entities/campaign_entity.dart';
import '../../features/campaigns/presentation/pages/campaign_details_page.dart';
import '../../features/help_me/presentation/pages/help_me_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../presentation/pages/category_page.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/onboarding_page.dart';
import '../../presentation/pages/splash_page.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String categoryRoute = '/categories';
  static const String helpMeRoute = '/help-me';
  static const String campaignDetail = "/campaignDetail";
  static const String solidaryRoute = "/solidary";
  static const String exploreRoute = "/explore";
  static const String myCampaignRoute = "/myCampaign";
  static const String chatRoute = "/chat";
  static const String blogRoute = "/blog";
  static const String feedRoute = "/feed";
  static const String eventRoute = "/events";
  static const String eventDetail = "/eventDetail";
  static const String ongProfileRoute = "/ongProfile";
  static const String favoriteRoute = "/favorite";
  static const String campaignUrgentsRoute = "/campaignUrgents";
  static const String myCampaignDetailRoute = "/myCampaignDetail";
  static const String campaignCreateUpdateRoute = "/campaignCreateUpdate";
  static const String createCampaignRoute = "/createCampaign";
  static const String createCampaignSuccessRoute = "/createCampaignSuccess";
  static const String editMyCampaignRoute = "/editMyCampaign";
  static const String myCampaignSettingsRoute = "/myCampaignSettings";
  static const String categoryCampaignsRoute = "/categoryCampaigns";
  static const String paymentRoute = "/payment";
  static const String profileRoute = "/profile";
  static const String createOngRoute = "/createOng";
  static const String successRegisterOng = "/successRegisterOng";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case categoryRoute:
        return MaterialPageRoute(builder: (_) => const CategoryPage());
      case helpMeRoute:
        return MaterialPageRoute(builder: (_) => const HelpMePage());

      case campaignDetail:
        final campaign = settings.arguments as CampaignEntity;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CampaignDetailsPage(campaign: campaign);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Text('Error: Unknown route'),
        );
    }
  }
}
