import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

class PerformanceInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final metric = FirebasePerformance.instance.newHttpMetric(
      options.uri.toString(),
      _getHttpMethod(options.method),
    );
    options.extra["metric"] = metric;

    await metric.start();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final metric = response.requestOptions.extra["metric"];
    if (metric is HttpMetric) {
      metric.httpResponseCode = response.statusCode;
      await metric.stop();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final metric = err.requestOptions.extra["metric"];
    if (metric is HttpMetric) {
      metric.httpResponseCode = err.response?.statusCode;
      await metric.stop();
    }
    super.onError(err, handler);
  }

  HttpMethod _getHttpMethod(String method) {
    switch (method.toUpperCase()) {
      case "POST":
        return HttpMethod.Post;
      case "PUT":
        return HttpMethod.Put;
      case "DELETE":
        return HttpMethod.Delete;
      default:
        return HttpMethod.Get;
    }
  }
}
