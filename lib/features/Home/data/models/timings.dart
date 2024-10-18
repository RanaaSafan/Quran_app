class Timings {
  final String? Fajr;
  final String? Sunrise;
  final String? Dhuhr;
  final String? Asr;
  final String? Sunset;
  final String? Maghrib;
  final String? Isha;

  Timings({
    this.Fajr,
    this.Sunrise,
    this.Dhuhr,
    this.Asr,
    this.Sunset,
    this.Maghrib,
    this.Isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      Fajr: json['Fajr'] as String?,
      Sunrise: json['Sunrise'] as String?,
      Dhuhr: json['Dhuhr'] as String?,
      Asr: json['Asr'] as String?,
      Sunset: json['Sunset'] as String?,
      Maghrib: json['Maghrib'] as String?,
      Isha: json['Isha'] as String?,
    );
  }

  @override
  String toString() {
    return 'Timings(Fajr: $Fajr,Sunrise: $Sunrise ,Dhuhr: $Dhuhr, Asr: $Asr,Sunset: $Sunset, Maghrib: $Maghrib, Isha: $Isha)';
  }//---> لحل مشكله Instance of 'Timings'

}





