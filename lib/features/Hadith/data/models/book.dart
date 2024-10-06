class Book {
  final int id;
  final String bookName;
  final String writerName;
  final Null aboutWriter;
  final String writerDeath;
 final  String bookSlug;

  Book(
      {required this.id,
        required this.bookName,
        required this.writerName,
        required this.aboutWriter,
        required this.writerDeath,
        required this.bookSlug});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id : json['id'],
        bookName : json['bookName'],
        writerName : json['writerName'],
    aboutWriter : json['aboutWriter'],
    writerDeath : json['writerDeath'],
    bookSlug :json['bookSlug'],
    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookName'] = this.bookName;
    data['writerName'] = this.writerName;
    data['aboutWriter'] = this.aboutWriter;
    data['writerDeath'] = this.writerDeath;
    data['bookSlug'] = this.bookSlug;
    return data;
  }
}
