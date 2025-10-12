import 'package:flutter/material.dart';

/// Provides color and text style customization for [UniversalWeekCalendar].
class CalendarTheme {
  final Color primaryColor;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? headerTextStyle;
  final TextStyle? weekdayTextStyle;
  final TextStyle? dateTextStyle;

  const CalendarTheme({
    this.primaryColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.grey,
    this.headerTextStyle,
    this.weekdayTextStyle,
    this.dateTextStyle,
  });
}
