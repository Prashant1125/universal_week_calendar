import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/calendar_theme.dart';
import '../utils/date_utils.dart';

/// A customizable horizontal week calendar widget that
/// works with any state management system.
///
/// Example:
/// ```dart
/// UniversalWeekCalendar(
///   selectedDate: DateTime.now(),
///   onDateSelected: (date) => print(date),
/// );
/// ```
class UniversalWeekCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final VoidCallback? onNextWeek;
  final VoidCallback? onPreviousWeek;
  final CalendarTheme theme;
  final double? height;

  const UniversalWeekCalendar({
    super.key,
    required this.selectedDate,
    this.onDateSelected,
    this.onNextWeek,
    this.onPreviousWeek,
    this.theme = const CalendarTheme(),
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final weekStart = DateUtilsHelper.getStartOfWeek(selectedDate);

    return Container(
      height: height ?? width * 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: onPreviousWeek,
                color: theme.textColor,
              ),
              Text(
                DateFormat('MMMM yyyy').format(selectedDate),
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