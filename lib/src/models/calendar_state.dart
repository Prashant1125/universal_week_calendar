/// Immutable model for storing calendar state, typically used when managing
/// state externally (e.g., with BLoC or Provider).
class CalendarState {
  /// The date currently selected by the user.
  final DateTime selectedDate;

  /// The first day of the currently displayed week (e.g., Sunday).
  final DateTime startOfWeek;

  /// Creates an immutable calendar state object.
  CalendarState({
    required this.selectedDate,
    required this.startOfWeek,
  });

  /// Returns a new [CalendarState] with updated values.
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
