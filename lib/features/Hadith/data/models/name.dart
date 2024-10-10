import '../../../quran/data/models/data.dart';
import 'book.dart';

class Name {
   int? code;
   String? message;
   List<Book>? data;
   bool? error;

  Name({
     this.code,
     this.message,
     this.data,
     this.error,
  });

  factory Name.fromJson(Map<String, dynamic> json) =>Name(
      code: json['code']as int?,
      message: json['message']as String?,
      data: (json['data'] as List<dynamic>?)?.map((item) => Book.fromJson(item as Map<String, dynamic>)).toList(),
      error: json['error']as bool?,
    );

}
