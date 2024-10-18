import 'package:quran_app/features/Home/data/models/timings.dart';

import 'date.dart';
import 'meta.dart';

class Data {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings:
      json['timings'] != null ? Timings.fromJson(json['timings']) : null,
      date:  json['date'] != null ? Date.fromJson(json['date']) : null,
      meta:   json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }
}
