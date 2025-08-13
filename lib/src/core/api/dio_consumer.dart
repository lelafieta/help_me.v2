import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:utueji/src/core/api/api_interceptor.dart';
import 'package:utueji/src/core/services/analytics_service.dart';

Dio createDio({required IFirebaseAnalyticsService analytics}) {
  final dio = Dio();

  dio.options
    ..baseUrl = dotenv.env['API_URL'] ?? 'https://fallback-url.com'
    ..connectTimeout = const Duration(seconds: 30)
    ..receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(ApiInterceptor(analytics: analytics));

  return dio;
}
