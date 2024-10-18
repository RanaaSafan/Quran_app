
import 'package:quran_app/features/Home/data/models/weekday.dart';

import 'Designation.dart';
import 'month.dart';

class Gregorian {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day']as String?,
      weekday: json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null,
      month: json['month'] != null ? Month.fromJson(json['month']) : null,
      year: json['year'],
      designation:
      json['designation'] != null ? Designation.fromJson(json['designation']) : null,
     // Designation.fromJson(json['designation']),
    );
  }
}