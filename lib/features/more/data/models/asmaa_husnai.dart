class AsmaUlHusna {
  final int? urutan;
  final String? latin;
  final String? arab;
  final String? arti;



  factory AsmaUlHusna.fromJson(Map<String, dynamic> json) {
    return AsmaUlHusna(
      urutan: json['urutan'] as int?,
      latin: json['latin'] as String?,
      arab: json['arab'] as String?,
      arti: json['arti'] as String?,


    );
  }

  AsmaUlHusna({required this.urutan, required this.latin, required this.arab, required this.arti});

  @override
  String toString() {
    return 'AsmaUlHusna{urutan: $urutan, latin: $latin, arab: $arab, arti: $arti}';
  }
}
