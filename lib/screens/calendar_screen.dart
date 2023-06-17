import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends HookConsumerWidget {
  static const path = '/calendar';
  static const name = 'CalendarScreen';
  static const location = path;

  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<DateTime> selectedDate = useState(DateTime.now());
    final ValueNotifier<CalendarFormat> calendarFormat =
        useState(CalendarFormat.month);
    final ValueNotifier<DateTime> focusedDate = useState(DateTime.now());

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'カレンダー',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white24,
          ),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: focusedDate.value,
                calendarFormat: calendarFormat.value,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  selectedDate.value = selectedDay;
                  focusedDate.value = focusedDay;
                },
                onFormatChanged: (format) {
                  if (calendarFormat.value != format) {
                    calendarFormat.value = format;
                  }
                },
                onPageChanged: (focusedDay) {
                  focusedDate.value = focusedDay;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
