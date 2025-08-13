import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';

import 'i_telemetry_service.dart';

class TelemetryService implements ITelemetryService {
  final FirebaseAnalytics analytics;
  final FirebaseCrashlytics crashlytics;
  final FirebasePerformance performance;

  TelemetryService({
    required this.analytics,
    required this.crashlytics,
    required this.performance,
  });

  @override
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> logError(
    dynamic exception, {
    StackTrace? stack,
    Map<String, Object>? context,
  }) async {
    // Adiciona informações extras para ajudar no debug
    if (context != null) {
      context.forEach((key, value) {
        crashlytics.setCustomKey(key, value.toString());
      });
    }

    await crashlytics.recordError(exception, stack, fatal: false);
  }

  @override
  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await analytics.setAnalyticsCollectionEnabled(enabled);
  }

  @override
  Future<void> setCurrentScreen({
    required String screenName,
    String? classOverride,
  }) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: classOverride ?? "",
    );
  }

  @override
  Future<T> traceExecution<T>({
    required String traceName,
    required Future<T> Function() action,
  }) async {
    final trace = performance.newTrace(traceName);
    await trace.start();
    try {
      final result = await action();
      return result;
    } finally {
      await trace.stop();
    }
  }
}
