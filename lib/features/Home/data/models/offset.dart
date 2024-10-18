class Offsets {
  final String? imsak;
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? sunset;
  final String? isha;
  final String? midnight;

  Offsets({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offsets.fromJson(Map<String, dynamic> json) {
    return Offsets(
      imsak: json['Imsak']as String?,
      fajr: json['Fajr']as String?,
      sunrise: json['Sunrise']as String?,
      dhuhr: json['Dhuhr']as String?,
      asr: json['Asr']as String?,
      maghrib: json['Maghrib']as String?,
      sunset: json['Sunset']as String?,
      isha: json['Isha']as String?,
      midnight: json['Midnight']as String?,
    );
  }
}