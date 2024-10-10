import 'Hadiths.dart';

class Hadith {
  final int? status;
  final String? message;
  final Hadiths? hadiths;

  Hadith({
    required this.status,
    required this.message,
    required this.hadiths,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      status: json['status'] ?? 0, // استخدم 0 كقيمة افتراضية
      message: json['message'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
      hadiths: Hadiths.fromJson(json['hadiths'] ?? {}),
    );
  }


}
