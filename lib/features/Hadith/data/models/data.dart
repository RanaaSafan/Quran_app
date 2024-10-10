// import 'book.dart';
// import 'chapter.dart';
//
// class Data {
//   final int? id;
//   final String? hadithNumber;
//   final String? englishNarrator;
//   final String? hadithEnglish;
//   final String? hadithUrdu;
//   final String? urduNarrator;
//   final String? hadithArabic;
//   final String? headingArabic; // يمكن أن تكون null
//   final String? headingUrdu;    // يمكن أن تكون null
//   final String? headingEnglish;  // يمكن أن تكون null
//   final String? chapterId;
//   final String? bookSlug;
//   final String? volume;
//   final String? status;
//   final Book? book;
//   final Chapter? chapter;
//
//   Data({
//     required this.id,
//     required this.hadithNumber,
//     required this.englishNarrator,
//     required this.hadithEnglish,
//     required this.hadithUrdu,
//     required this.urduNarrator,
//     required this.hadithArabic,
//     this.headingArabic,
//     this.headingUrdu,
//     this.headingEnglish,
//     required this.chapterId,
//     required this.bookSlug,
//     required this.volume,
//     required this.status,
//     required this.book,
//     required this.chapter,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       id: json['id'] ?? 1, // استخدم 1 كقيمة افتراضية
//       hadithNumber: json['hadithNumber'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       englishNarrator: json['englishNarrator'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       hadithEnglish: json['hadithEnglish'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       hadithUrdu: json['hadithUrdu'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       urduNarrator: json['urduNarrator'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       hadithArabic: json['hadithArabic'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       headingArabic: json['headingArabic'], // يمكن أن تكون null
//       headingUrdu: json['headingUrdu'], // يمكن أن تكون null
//       headingEnglish: json['headingEnglish'], // يمكن أن تكون null
//       chapterId: json['chapterId'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       bookSlug: json['bookSlug'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       volume: json['volume'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       status: json['status'] ?? "", // استخدم سلسلة فارغة كقيمة افتراضية
//       book: Book.fromJson(json['book'] ?? {}), // Provide empty map if null
//       chapter: Chapter.fromJson(json['chapter'] ?? {}), // Provide empty map if null
//     );
//   }
// }
// class Data {
//   String? name;
//   String? id;
//   int? available;
//
//   Data({this.name, this.id, this.available});
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       name: json["name"] as String?, // Cast to String? for nullable
//       id: json["id"] as String?, // Cast to String? for nullable
//       available: json["available"] as int?, // Cast to int? for nullable
//     );
//   }
// }
