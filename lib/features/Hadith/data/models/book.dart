class Book {
  final int id;
  final String bookName;
  final String writerName;
  final String? aboutWriter; // يمكن أن تكون null
  final String writerDeath;
  final String bookSlug;

  Book({
    required this.id,
    required this.bookName,
    required this.writerName,
    this.aboutWriter, // يمكن أن تكون null
    required this.writerDeath,
    required this.bookSlug,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      bookName: json['bookName'],
      writerName: json['writerName'],
      aboutWriter: json['aboutWriter']?.isNotEmpty == true ? json['aboutWriter'] : " ", // يمكن أن تكون null
      writerDeath: json['writerDeath'],
      bookSlug: json['bookSlug'],
    );
  }


}