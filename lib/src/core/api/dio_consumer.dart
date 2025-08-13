import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:utueji/src/core/api/api_interceptor.dart';
import 'package:utueji/src/core/api/performance_interceptor.dart';

import '../services/i_telemetry_service.dart';

Dio createDio({required ITelemetryService telemetry}) {
  final dio = Dio();

  dio.options
    ..baseUrl = dotenv.env['API_URL'] ?? 'https://fallback-url.com'
    ..connectTimeout = const Duration(seconds: 30)
    ..receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(ApiInterceptor(telemetry: telemetry));
  dio.interceptors.add(PerformanceInterceptor());

  return dio;
}
