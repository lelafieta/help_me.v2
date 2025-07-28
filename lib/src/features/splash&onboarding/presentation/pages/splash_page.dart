import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:utueji/src/config/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await storage.read(key: 'access_tokenn');

    if (mounted) {
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacementNamed(context, AppRoutes.solidaryRoute);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // pode personalizar com logo ou animação
      ),
    );
  }
}
