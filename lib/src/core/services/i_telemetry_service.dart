abstract class ITelemetryService {
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  });
  Future<void> logError(
    dynamic exception, {
    StackTrace? stack,
    Map<String, Object>? context,
  });
  Future<void> setAnalyticsCollectionEnabled(bool enabled);
  Future<void> setCurrentScreen({
    required String screenName,
    String? classOverride,
  });

  Future<T> traceExecution<T>({
    required String traceName,
    required Future<T> Function() action,
  });
}
