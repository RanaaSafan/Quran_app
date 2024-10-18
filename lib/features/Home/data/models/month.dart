class Month {
  final int? number;
  final String? en;
  final String? ar;

  Month({
    required this.number,
    required this.en,
    this.ar,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
      number: json['number']as int?,
      en: json['en']as String?,
      ar: json['ar']as String?,
    );
  }
}
