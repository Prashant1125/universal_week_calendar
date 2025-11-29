import 'package:flutter/material.dart';

/// Provides color and text style customization for the [UniversalWeekCalendar] widget.
class CalendarTheme {
  /// The primary color used for highlighting the selected date. Defaults to [Colors.blue].
  final Color primaryColor;

  /// The background color of the calendar container. Defaults to [Colors.white].
  final Color backgroundColor;

  /// The default color for general text elements, like navigation icons. Defaults to [Colors.grey].
  final Color textColor;

  /// Optional custom [TextStyle] for the header (e.g., "November 2025").
  final TextStyle? headerTextStyle;

  /// Optional custom [TextStyle] for the weekday labels (e.g., "SUN", "MON").
  final TextStyle? weekdayTextStyle;

  /// Optional custom [TextStyle] for the date numbers (e.g., "29", "30").
  final TextStyle? dateTextStyle;

  /// Creates a theme configuration for the week calendar.
  const CalendarTheme({
    this.primaryColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.grey,
    this.headerTextStyle,
    this.weekdayTextStyle,
    this.dateTextStyle,
  });
}
