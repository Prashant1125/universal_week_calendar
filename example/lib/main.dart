import 'package:flutter/material.dart';
import 'package:universal_week_calendar/universal_week_calendar.dart';

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
  DateTime _selectedDate = DateTime.now();
  late DateTime _startOfWeek;

  @override
  void initState() {
    super.initState();
    _startOfWeek = _getStartOfWeek(_selectedDate);
  }

  DateTime _getStartOfWeek(DateTime date) {
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
      _selectedDate = _startOfWeek; // default select first day of week
    });
  }

  // Move to previous week
  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
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
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            selectedDate: _selectedDate,
            onDateSelected: _onDateSelected,
            onNextWeek: _nextWeek,
            onPreviousWeek: _previousWeek,
            theme: const CalendarTheme(
              primaryColor: Colors.blue,
              backgroundColor: Colors.white,
              textColor: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Selected Date: ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
