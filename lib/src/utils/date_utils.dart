/// Helper functions for calendar date calculations.
class DateUtilsHelper {
  /// Returns the start of week (Sunday) for the provided date.
  ///
  /// This implementation assumes **Sunday** as the first day of the week.
  /// If you want Monday as start, change `weekday % 7` to `weekday - 1`.
  static DateTime getStartOfWeek(DateTime date) {
    final weekday = date.weekday;
    return DateTime(date.year, date.month, date.day)
        .subtract(Duration(days: weekday % 7));
  }

  /// Checks if two [DateTime] objects represent the exact same day (year, month, and day).
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}