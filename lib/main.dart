import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:help_me/config/themes.dart';
import 'package:help_me/config/theme_cubit/theme_cubit.dart';
import 'package:help_me/injection_container.dart' as di;
import 'package:help_me/config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Help-me',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.splashRoute,
          );
        },
      ),
    );
  }
}