import 'package:intl/intl.dart';

class AppUtils {
  static String formatCurrency(num value) {
    return "AOA ${NumberFormat.compact(locale: 'pt_AO').format(value)}";
  }

  static String formatFullCurrency(num value) {
    return NumberFormat.currency(locale: 'pt_AO', symbol: "AOA").format(value);
  }

  static int daysBetweenToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.difference(today).inDays;
  }

  /// Retorna quantos dias já se passaram desde a data até hoje (sempre positivo)
  static int daysSinceDate(DateTime date) {
    DateTime today = DateTime.now();
    return today.difference(date).inDays.abs();
  }

  static double calculateFundraisingPercentage(
    double? fundsRaised,
    double? fundraisingGoal,
  ) {
    if (fundsRaised == null ||
        fundraisingGoal == null ||
        fundraisingGoal == 0) {
      return 0.0;
    }

    double percentage = (fundsRaised / fundraisingGoal) * 100;
    return double.parse(percentage.toStringAsFixed(2));
  }
}
