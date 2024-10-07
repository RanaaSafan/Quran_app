import 'book.dart';
import 'chapter.dart';

class Data {
  final int id;
  final String hadithNumber;
  final String englishNarrator;
  final String hadithEnglish;
  final String hadithUrdu;
  final String urduNarrator;
  final String? hadithArabic;
  final String? headingArabic;
  final String? headingUrdu;
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
      hadithArabic: json['hadithArabic']?.isNotEmpty == true ? json['hadithArabic'] : " ", // تحقق من أن القيمة ليست فارغة
      headingArabic: json['headingArabic']?.isNotEmpty == true ? json['headingArabic'] : null, // يمكن أن تكون null
      headingUrdu: json['headingUrdu']?.isNotEmpty == true ? json['headingUrdu'] : null, // يمكن أن تكون null
      headingEnglish: json['headingEnglish'],
      chapterId: json['chapterId'],
      bookSlug: json['bookSlug'],
      volume: json['volume'],
      status: json['status'],
      book: Book.fromJson(json['book']),
      chapter: Chapter.fromJson(json['chapter']),
    );
  }


}
