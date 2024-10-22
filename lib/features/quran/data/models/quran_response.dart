import '../../../Home/data/models/data.dart';

class QuranResponse {
  int? code;
  String? status;
  Data datas;

  QuranResponse({
    required this.code,
    required this.status,
    required this.datas,
  });

  factory QuranResponse.fromJson(Map<String, dynamic> json) {
    return QuranResponse(
      code: json['code'],
      status: json['status'],
      datas: Data.fromJson(json['data']),
    );
  }
  @override
  String toString() {
    return 'Surah(code: $code, status: $status, data: $datas)';
  }}
