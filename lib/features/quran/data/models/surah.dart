import 'package:quran_app/features/quran/data/models/data.dart';

class Surah {
  Surah({
    required this.code,
    required this.status,
    required this.data,
  });

  final int? code;
  final String? status;
  final List<Data> data;

  factory Surah.fromJson(Map<String, dynamic> json){
    return Surah(
      code: json["code"],
      status: json["status"],
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data.map((x) => x?.toJson()).toList(),
  };

}
