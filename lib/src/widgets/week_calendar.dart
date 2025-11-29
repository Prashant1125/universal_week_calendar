import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/calendar_theme.dart';
import '../utils/date_utils.dart';

/// A customizable horizontal week calendar widget that allows users to select
/// a date and navigate between weeks.
///
/// This widget is designed to be highly flexible and works without any
/// dependency on external state management solutions.
///
/// Example:
/// ```dart
/// UniversalWeekCalendar(
///   selectedDate: DateTime.now(),
///   onDateSelected: (date) => print(date),
///   onNextWeek: () => setState(() { /* logic */ }),
///   onPreviousWeek: () => setState(() { /* logic */ }),
/// );
/// ```
class UniversalWeekCalendar extends StatelessWidget {
  /// The currently selected date displayed in the calendar.
  final DateTime selectedDate;

  /// A callback function that is called when a date is tapped by the user.
  final ValueChanged<DateTime>? onDateSelected;

  /// A callback function executed when the user taps the next week button (right arrow).
  final VoidCallback? onNextWeek;

  /// A callback function executed when the user taps the previous week button (left arrow).
  final VoidCallback? onPreviousWeek;

  /// The theme used to customize the colors and text styles of the calendar.
  final CalendarTheme theme;

  /// Optional text to display in the header. If null, it defaults to the
  /// formatted month and year of the [selectedDate].
  final String? headerText;

  /// Optional fixed height for the calendar widget. If null, the height is
  /// dynamically calculated based on screen width.
  final double? height;

  /// Optional outer margin for the calendar container.
  final EdgeInsetsGeometry? margin;

  /// Optional inner padding for the calendar container.
  final EdgeInsetsGeometry? padding;

  /// Creates a Universal Week Calendar widget.
  const UniversalWeekCalendar({
    super.key,
    required this.selectedDate,
    this.onDateSelected,
    this.onNextWeek,
    this.onPreviousWeek,
    this.theme = const CalendarTheme(),
    this.height,
    this.headerText,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // Calculate the start of the week (Sunday by default) based on the selected date.
    final weekStart = DateUtilsHelper.getStartOfWeek(selectedDate);

    return Container(
      // Dynamic height calculation
      height: height ?? width * 0.45,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      padding: padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(width * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.2 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row for Navigation and Month/Year Display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: onPreviousWeek,
                color: theme.textColor,
              ),
              Text(
                headerText ?? DateFormat('MMMM yyyy').format(selectedDate),
                style: theme.headerTextStyle ??
                    TextStyle(
                      fontSize: width * 0.037,
                      fontWeight: FontWeight.w600,
                      color: theme.textColor,
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: onNextWeek,
                color: theme.textColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Weekday and Date Row
          SizedBox(
            height: width * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              separatorBuilder: (_, __) => SizedBox(width: width * 0.03),
              itemBuilder: (context, index) {
                final date = weekStart.add(Duration(days: index));
                final isSelected = DateUtilsHelper.isSameDay(date, selectedDate);

                return GestureDetector(
                  onTap: () => onDateSelected?.call(date),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Weekday Text (SUN, MON, etc.)
                      Text(
                        DateFormat('E').format(date).toUpperCase(),
                        style: theme.weekdayTextStyle ??
                            TextStyle(
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(height: width * 0.035),
                      // Date Circle (Day of Month)
                      Container(
                        width: width * 0.09,
                        height: width * 0.09,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.primaryColor
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: theme.dateTextStyle ??
                              TextStyle(
                                fontSize: width * 0.037,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade700,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}