import 'package:flutter/material.dart';
import 'package:help_me/features/help_me/presentation/pages/help_me_page.dart';
import 'package:help_me/presentation/pages/home_page.dart';
import 'package:help_me/presentation/pages/onboarding_page.dart';
import 'package:help_me/presentation/pages/splash_page.dart';
import 'package:help_me/presentation/pages/login_page.dart';
import 'package:help_me/presentation/pages/category_page.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String categoryRoute = '/categories';
  static const String helpMeRoute = '/help-me';

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

      default:
        return MaterialPageRoute(
          builder: (_) => const Text('Error: Unknown route'),
        );
    }
  }
}
