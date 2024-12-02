
import 'model_edition_surah/ayah.dart';
import 'model_shiekh_names/edition.dart';

class Data {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;
  final List<Ayah>? ayahs;
  final Edition? edition;

  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['ayahs'] as List? ?? [];
    List<Ayah> ayahList = list.map((i) => Ayah.fromJson(i)).toList();

    return Data(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      ayahs: ayahList,
      edition: json['edition'] != null ? Edition.fromJson(json['edition']) : null,
    );
  }

  @override
  String toString() {
    return 'Data(number: $number, name: $name, englishName: $englishName, numberOfAyahs: $numberOfAyahs, ayahs: $ayahs, edition: $edition)';
  }
}
