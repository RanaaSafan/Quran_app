import 'data.dart';

class Surah {
  final int? code;
  final String? status;
  final List<Data> data;

  Surah({required this.code, required this.status, this.data = const []});

  // Factory constructor for creating a Surah instance from JSON
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      code: json['code'],
      status: json['status'],
      data: (json['data'] != null)
          ? (json['data'] as List).map((v) => Data.fromJson(v)).toList()
          : [],
    );
  }

  // Method to convert a Surah instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {
      'code': code,
      'status': status,
      'data': data.map((v) => v.toJson()).toList(),
    };
    return jsonData;
  }
}
