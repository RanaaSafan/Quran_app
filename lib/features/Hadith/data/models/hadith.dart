import 'Hadiths.dart';

class Hadith {
  final int status;
  final String message;
  final Hadiths? hadiths;

  Hadith({
    required this.status,
    required this.message,
    this.hadiths,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      status: json['status'],
      message: json['message'],
      hadiths: json['hadiths'] != null ? Hadiths.fromJson(json['hadiths']) : null,
    );
  }


}