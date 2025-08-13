import 'package:firebase_analytics/firebase_analytics.dart';

abstract class IFirebaseAnalyticsService {
  Future<void> logEvent({String? name, Map<String, Object>? parameters});
  Future<void> setCollectionEnabled(bool enabled);
}

class FirebaseAnalyticsService implements IFirebaseAnalyticsService {
  final FirebaseAnalytics analytics;

  FirebaseAnalyticsService({required this.analytics});

  @override
  Future<void> logEvent({String? name, Map<String, Object>? parameters}) {
    return analytics.logEvent(name: name ?? "unknown", parameters: parameters);
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    await analytics.setAnalyticsCollectionEnabled(enabled);
  }
}
