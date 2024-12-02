import 'hadiths.dart';

class Data {
  String? name;
  String? id;
  int? available;
  int? requested;
  List<Hadiths>? hadiths;

  Data({
    required this.name,
    required this.id,
    required this.available,
    required this.requested,
    required this.hadiths,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'] as String?,
      id: json['id'] as String?,
      available: json['available'] as int? ,
      requested: json['requested'] as int? ,
      hadiths: json['hadiths'] != null
          ? (json['hadiths'] as List)
          .map((v) => Hadiths.fromJson(v as Map<String, dynamic>))
          .toList()
          : [],
    );
  }

  @override
  String toString() {
    return 'Data{name: $name, id: $id, available: $available, requested: $requested, hadiths: $hadiths}';
  }
}
