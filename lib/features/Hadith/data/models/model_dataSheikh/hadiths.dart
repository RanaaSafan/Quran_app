class Hadiths {
  int? number;
  String? arab;
  String? id;

  Hadiths({
    required this.number,
    required this.arab,
    required this.id,
  });

  factory Hadiths.fromJson(Map<String, dynamic> json) {
    return Hadiths(
      number: json['number'] as int?,
      arab: json['arab'] as String?,
      id: json['id'] as String?,
    );
  }

  @override
  String toString() {
    return 'Hadiths{number: $number, arab: $arab, id: $id}';
  }
}
