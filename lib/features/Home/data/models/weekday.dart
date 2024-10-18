
class Weekday {
  final String? en;
  final String? ar;

  Weekday({
    required this.en,
    this.ar,
  });

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(
      en: json['en']as String?,
      ar: json['ar']as String?,
    );
  }
}

