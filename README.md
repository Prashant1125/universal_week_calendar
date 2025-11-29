# Universal Week Calendar 📅

![Pub Version](https://img.shields.io/pub/v/universal_week_calendar?color=blue&label=pub%20version)
![Likes](https://img.shields.io/pub/likes/universal_week_calendar?color=yellow)
![Popularity](https://img.shields.io/pub/popularity/universal_week_calendar?color=green)

✨ **Universal Week Calendar**

**A highly customizable, dependency-free Flutter package for displaying and navigating dates week-by-week.**
Easily integrate into any Flutter project — works without any dependency on state management solutions like GetX, Provider, or BLoC.

## Demo

![Demo](https://raw.githubusercontent.com/Prashant1125/universal_week_calendar/main/universal_celender.gif)

---

## Installation

Add this to your package’s `pubspec.yaml` file:

```yaml
dependencies:
  universal_week_calendar : ^0.1.1
  ```

Then

```
flutter pub get
```

## Example
```
import 'package:flutter/material.dart';
import 'package:universal_week_calendar/universal_week_calendar.dart';
import 'package:intl/intl.dart'; // Required for DateFormat utility

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Universal Week Calendar Example",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalendarExampleScreen(),
    );
  }
}

class CalendarExampleScreen extends StatefulWidget {
  const CalendarExampleScreen({super.key});

  @override
  State<CalendarExampleScreen> createState() => _CalendarExampleScreenState();
}

class _CalendarExampleScreenState extends State<CalendarExampleScreen> {
  // Initialize with the current date
  DateTime _selectedDate = DateTime.now();
  late DateTime _startOfWeek;

  @override
  void initState() {
    super.initState();
    // Calculate the start of the week for the initial date
    _startOfWeek = _getStartOfWeek(_selectedDate);
  }

  // Utility function to get the start of the week (Sunday as first day)
  DateTime _getStartOfWeek(DateTime date) {
    // date.weekday returns 1 for Monday, 7 for Sunday.
    // % 7 gives 0 for Sunday, 1 for Monday, ..., 6 for Saturday.
    // Subtracting this gives the date of the previous Sunday.
    return date.subtract(Duration(days: date.weekday % 7));
  }

  // Select date from calendar
  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  // Move to next week
  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(const Duration(days: 7));
      // Select the first day of the new week as a default
      _selectedDate = _startOfWeek; 
    });
  }

  // Move to previous week
  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
      // Select the first day of the new week as a default
      _selectedDate = _startOfWeek;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Universal Week Calendar Demo")),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UniversalWeekCalendar(
            // Display the current Month and Year based on the selected date
            headerText : DateFormat('MMMM yyyy').format(_selectedDate),
            
            // Customize appearance
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            
            // Current selected date
            selectedDate: _selectedDate,
            
            // Callbacks for user interaction
            onDateSelected: _onDateSelected,
            onNextWeek: _nextWeek,
            onPreviousWeek: _previousWeek,
            
            // Custom theming
            theme: const CalendarTheme(
              primaryColor: Colors.blue,
              backgroundColor: Colors.white,
              textColor: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            // Display the currently selected date
            "Selected Date: ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

```
## Features

- Week-by-Week Navigation: Effortlessly move between previous and next weeks using dedicated controls.
- Date Selection: Easily select and highlight any date within the displayed week.
- Customizable Theme: Full control over colors using the CalendarTheme object (e.g., primaryColor, backgroundColor, textColor).
- Custom Header Text: Inject your own widget or formatted text into the header using the headerText parameter.
- No Dependencies: Works out-of-the-box without requiring any state management packages like GetX, Provider, or BLoC.
- Clear Callbacks: Provides explicit callbacks (onDateSelected, onNextWeek, onPreviousWeek) to manage state changes externally.

## Thank you
