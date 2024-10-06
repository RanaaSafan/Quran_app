import 'data.dart';

class Surah {
  final int? code;
  final String? status;
  final List<Data> data;

  Surah({
    required this.code,
    required this.status,
    required this.data,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      code: json["code"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Data>.from((json["data"] as List).map((item) => Data.fromJson(item))),
    );
  }

  @override
  String toString() {
    return 'Surah(code: $code, status: $status, data: $data)';
  }
}