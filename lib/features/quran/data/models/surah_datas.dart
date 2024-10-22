class SurahDatas {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  SurahDatas({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory SurahDatas.fromJson(Map<String, dynamic> json) {
    return SurahDatas(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      englishNameTranslation: json["englishNameTranslation"],
      numberOfAyahs: json["numberOfAyahs"],
      revelationType: json["revelationType"],
    );
  }

  @override
  String toString() {
    return 'SurahDatas(number: $number, name: $name, englishName: $englishName, numberOfAyahs: $numberOfAyahs)';
  }

}
