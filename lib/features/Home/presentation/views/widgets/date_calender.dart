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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D56B3),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      height: 260, // Reduced height further
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
          //  print(_selectedDay);// Update the focused day
          });
           context.read<PrayerCubit>().getPrayer(_selectedDay.toIso8601String());
        },
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(fontSize: 12), // Reduced text size
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
        rowHeight: 30, // Further reduced row height
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(fontSize: 20), // Reduced header text size
          formatButtonVisible: false, // Hide format button
        ),
      ),
    );
  }
}
