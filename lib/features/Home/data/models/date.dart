import 'Gregorian.dart';
import 'hijri.dart';

class Date {
  final String? readable;
  final String? timestamp;
  final Hijri? hijri;
  final Gregorian? gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json['readable'] as String?,
      timestamp: json['timestamp']as String?,
      hijri: json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null,
      gregorian: json['gregorian'] != null ? Gregorian.fromJson(json['gregorian']) : null,
    );
  }
}
