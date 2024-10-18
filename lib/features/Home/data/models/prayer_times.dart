import '../../../quran/data/models/data.dart';

class PrayerTimes {
  final int? code;
  final String? status;
  final Data? data;

  PrayerTimes({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      code: json['code']as int?,
      status: json['status']as String?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}