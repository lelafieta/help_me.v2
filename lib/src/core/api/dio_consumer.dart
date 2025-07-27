import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Dio createDio() {
  final dio = Dio();
  const storage = FlutterSecureStorage();  
  dio.options
    ..baseUrl = dotenv.env['API_URL'] ?? 'https://fallback-url.com'
    ..connectTimeout = const Duration(seconds: 10)
    ..receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ),
  );

  return dio;
}
