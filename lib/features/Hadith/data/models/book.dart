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
