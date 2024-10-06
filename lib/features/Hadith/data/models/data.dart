import 'book.dart';
import 'chapter.dart';

class Data {
  final int id;
  final String hadithNumber;
  final String englishNarrator;
  final String hadithEnglish;
  final String hadithUrdu;
  final String urduNarrator;
  final String hadithArabic;
  final String headingArabic;
  final String headingUrdu;
  final String headingEnglish;
  final String chapterId;
  final String bookSlug;
  final String volume;
  final String status;
  final Book book;
  final Chapter chapter;

  Data({
    required this.id,
    required this.hadithNumber,
    required this.englishNarrator,
    required this.hadithEnglish,
    required this.hadithUrdu,
    required this.urduNarrator,
    required this.hadithArabic,
    required this.headingArabic,
    required this.headingUrdu,
    required this.headingEnglish,
    required this.chapterId,
    required this.bookSlug,
    required this.volume,
    required this.status,
    required this.book,
    required this.chapter,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      hadithNumber: json['hadithNumber'],
      englishNarrator: json['englishNarrator'],
      hadithEnglish: json['hadithEnglish'],
      hadithUrdu: json['hadithUrdu'],
      urduNarrator: json['urduNarrator'],
      hadithArabic: json['hadithArabic'],
      headingArabic: json['headingArabic'],
      headingUrdu: json['headingUrdu'],
      headingEnglish: json['headingEnglish'],
      chapterId: json['chapterId'],
      bookSlug: json['bookSlug'],
      volume: json['volume'],
      status: json['status'],
      book: Book.fromJson(json['book']),
      chapter: Chapter.fromJson(json['chapter']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hadithNumber'] = hadithNumber;
    data['englishNarrator'] = englishNarrator;
    data['hadithEnglish'] = hadithEnglish;
    data['hadithUrdu'] = hadithUrdu;
    data['urduNarrator'] = urduNarrator;
    data['hadithArabic'] = hadithArabic;
    data['headingArabic'] = headingArabic;
    data['headingUrdu'] = headingUrdu;
    data['headingEnglish'] = headingEnglish;
    data['chapterId'] = chapterId;
    data['bookSlug'] = bookSlug;
    data['volume'] = volume;
    data['status'] = status;
    data['book'] = book.toJson();
    data['chapter'] = chapter.toJson();
    return data;
  }
}
