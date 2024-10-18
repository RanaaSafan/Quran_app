import 'dart:ui';

import 'method.dart';
import 'offset.dart';

class Meta {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Offsets? offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double? ,
      timezone: json['timezone']as String?,
      method: json['method'] != null ? Method.fromJson(json['method']) : null,
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod']as String?,
      midnightMode: json['midnightMode'] as String? ,
      school: json['school']as String?,
      offset: json['offset'] != null ? Offsets.fromJson(json['offset']) : null,
     // Offsets.fromJson(json['offset']),
    );
  }
}
