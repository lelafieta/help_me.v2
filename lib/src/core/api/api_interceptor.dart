import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/i_telemetry_service.dart';

class ApiInterceptor extends Interceptor {
  final ITelemetryService telemetry;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  ApiInterceptor({required this.telemetry});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: 'access_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print("📤 Request: ${options.method} ${options.uri}");
    telemetry.logEvent(
      name: "api_request_started",
      parameters: {"method": options.method, "url": options.path},
    );

    // await telemetryService.traceExecution(
    //   traceName: "api_${options.method}_${options.path}",
    //   action: () async {
    //     handler.next(options);
    //   },
    // );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ Success [${response.statusCode}]: ${response.requestOptions.uri}");
    telemetry.logEvent(
      name: "api_request_success",
      parameters: {
        "status_code": response.statusCode!,
        "url": response.requestOptions.path,
      },
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❌ Error [${err.response?.statusCode}]: ${err.requestOptions.uri}");
    telemetry.logEvent(
      name: "api_request_error",
      parameters: {
        "status_code": err.response!.statusCode.toString(),
        "url": err.requestOptions.path,
        "message": err.message!,
      },
    );

    super.onError(err, handler);
  }
}
