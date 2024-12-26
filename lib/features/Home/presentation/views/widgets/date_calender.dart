import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/functions/api_service.dart';
import '../../../data/Repo/prayer_repo_impl.dart';
import '../../controller/prayer_cubit.dart';

class DateCalender extends StatefulWidget {
  @override
  _DateCalenderState createState() => _DateCalenderState();
}

class _DateCalenderState extends State<DateCalender> {
  late DateTime _selectedDay; // The selected day
  late DateTime _focusedDay; // The focused day

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('التقويم')),
        backgroundColor: Color(0xFFbf360c), // You can adjust the color
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFbf360c),
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            context.read<PrayerCubit>().getPrayer(_selectedDay.toIso8601String());
          },
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(fontSize: 18, color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            markerDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          rowHeight: 50, // Adjusted row height
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Adjusted header text style
            formatButtonVisible: false, // Hide format button
            titleCentered: true, // Center title
          ),
        ),
      ),
    );
  }
}
