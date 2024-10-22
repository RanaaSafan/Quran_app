class Ayah {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    var audioSecondaryList = List<String>.from(json['audioSecondary'] ?? []);

    return Ayah(
      number: json['number'] as int?,
      audio: json['audio'] as String?,
      audioSecondary: audioSecondaryList,
      text: json['text'] as String?,
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int,
      hizbQuarter: json['hizbQuarter'] as int?,
      sajda: json['sajda'] as bool?,
    );
  }

  @override
  String toString() {
    return 'Ayah(number: $number, audio: $audio, audioSecondary: $audioSecondary, text: $text, numberInSurah: $numberInSurah, juz: $juz, manzil: $manzil, page: $page, ruku: $ruku, hizbQuarter: $hizbQuarter, sajda: $sajda)';
  }
}
