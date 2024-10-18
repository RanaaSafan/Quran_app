import 'package:quran_app/features/Home/data/models/weekday.dart';

import 'Designation.dart';
import 'month.dart';

class Hijri {
  final String? date;
  final String? format;
  final String? day;
  final Weekday weekday;
  final Month month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date']as String?,
      format: json['format']as String?,
      day: json['day']as String?,
      weekday: Weekday.fromJson(json['weekday']),
      month: Month.fromJson(json['month']),
      year: json['year']as String?,
      designation: json['designation'] != null ? Designation.fromJson(json['designation']) : null,
      holidays:json['holidays'] != null ? List<dynamic>.from(json['holidays']) : [],
    );
  }
}
