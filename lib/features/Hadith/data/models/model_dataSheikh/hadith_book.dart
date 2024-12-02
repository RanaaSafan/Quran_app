import '../../../../Home/data/models/data.dart';

class HadithBook {
  int? code;
  String? message;
  Data? data;
  bool? error;

  HadithBook({
    this.code,
    this.message,
    this.data,
    this.error,
  });

  factory HadithBook.fromJson(Map<String, dynamic> json) {
    return HadithBook(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      error: json['error'] as bool?,
    );
  }

  @override
  String toString() {
    return 'HadithBook{code: $code, message: $message, data: $data, error: $error}';
  }
}
