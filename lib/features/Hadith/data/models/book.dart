// class Book {
//   final int? id;
//   final String? bookName;
//   final String? writerName;
//   final String? aboutWriter; // يمكن أن تكون null
//   final String? writerDeath;
//   final String? bookSlug;
//
//   Book({
//     required this.id,
//     required this.bookName,
//     required this.writerName,
//     this.aboutWriter,
//     required this.writerDeath,
//     required this.bookSlug,
//   });
//
//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       id: json['id']?? 1,
//       bookName: json['bookName'],
//       writerName: json['writerName'],
//       aboutWriter: json['aboutWriter'],
//       writerDeath: json['writerDeath'],
//       bookSlug: json['bookSlug'],
//     );
//   }
// }
class Book {
   String? name;
   String? id;
   int? available;

  Book({
     this.name,
     this.id,
     this.available,
  });

  factory Book.fromJson(Map<String, dynamic> json)
    => Book(
      name: json['name']as String?,
      id: json['id']as String?,
      available: json['available']as int?,
    );
   @override
   String toString() {
     return 'Book{name: $name, id: $id, available: $available}';
   }
}
