import 'package:flutter_test/flutter_test.dart';
import 'package:universal_week_calendar/universal_week_calendar.dart';

void main() {
  test('DateUtilsHelper should return correct start of week', () {
    final date = DateTime(2025, 10, 12); // Sunday
    final start = DateUtilsHelper.getStartOfWeek(date);
    expect(start.weekday, 7); // Sunday as start
  });

  test('isSameDay should compare correctly', () {
    final a = DateTime(2025, 10, 12);
    final b = DateTime(2025, 10, 12);
    expect(DateUtilsHelper.isSameDay(a, b), true);
  });
}
