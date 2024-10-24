import 'package:quran_app/features/quran/data/models/quran_edition.dart';

class QuranEditionResponse {
  final int code;
  final String status;
  final List<QuranEdition> data;

  QuranEditionResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory QuranEditionResponse.fromJson(Map<String, dynamic> json) {
    return QuranEditionResponse(
      code: json['code'],
      status: json['status'],
      data: List<QuranEdition>.from(
        json['data'].map((edition) => QuranEdition.fromJson(edition)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'data': data.map((edition) => edition.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Surah(code: $code, status: $status, data: $data)';
  }

}