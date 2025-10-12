/// Immutable model for storing selected date and start of the week.
class CalendarState {
  final DateTime selectedDate;
  final DateTime startOfWeek;

  CalendarState({
    required this.selectedDate,
    required this.startOfWeek,
  });

  CalendarState copyWith({
    DateTime? selectedDate,
    DateTime? startOfWeek,
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      startOfWeek: startOfWeek ?? this.startOfWeek,
    );
  }
}
