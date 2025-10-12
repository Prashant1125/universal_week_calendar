import 'package:flutter/material.dart';
import 'package:universal_week_calendar/universal_week_calendar.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

    @override
      State<ExampleApp> createState() => _ExampleAppState();
      }

      class _ExampleAppState extends State<ExampleApp> {
        DateTime selectedDate = DateTime.now();

          @override
            Widget build(BuildContext context) {
                return MaterialApp(
                      title: 'Universal Week Calendar Demo',
                            home: Scaffold(
                                    appBar: AppBar(title: const Text('Week Calendar Demo')),
                                            body: Center(
                                                      child: UniversalWeekCalendar(
                                                                  selectedDate: selectedDate,
                                                                              onDateSelected: (date) => setState(() => selectedDate = date),
                                                                                        ),
                                                                                                ),
                                                                                                      ),
                                                                                                          );
                                                                                                            }
                                                                                                            }