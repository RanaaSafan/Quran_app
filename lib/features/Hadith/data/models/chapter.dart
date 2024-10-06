class Chapter {
  final int id;
  final String chapterNumber;
  final String chapterEnglish;
  final String chapterUrdu;
  final String chapterArabic;
  final String bookSlug;

  Chapter(
      {required this.id,
      required this.chapterNumber,
      required this.chapterEnglish,
      required this.chapterUrdu,
      required this.chapterArabic,
      required this.bookSlug});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      chapterNumber: json['chapterNumber'],
      chapterEnglish: json['chapterEnglish'],
      chapterUrdu: json['chapterUrdu'],
      chapterArabic: json['chapterArabic'],
      bookSlug: json['bookSlug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapterNumber'] = this.chapterNumber;
    data['chapterEnglish'] = this.chapterEnglish;
    data['chapterUrdu'] = this.chapterUrdu;
    data['chapterArabic'] = this.chapterArabic;
    data['bookSlug'] = this.bookSlug;
    return data;
  }
}
