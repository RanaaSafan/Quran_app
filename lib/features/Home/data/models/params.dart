class Params {
  final double? fajr;
  final String? isha;

  Params({
    required this.fajr,
    required this.isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      fajr: json['Fajr']as double?,
      isha: json['Isha']as String?,
    );
  }
}
