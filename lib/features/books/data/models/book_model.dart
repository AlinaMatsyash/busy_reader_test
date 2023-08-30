import 'package:busy_reader/features/books/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required int count,
    required List<BookInfo> data,
  }) : super(count: count, data: data);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      count: json['count'],
      data: (json['data'] as List)
          .map((item) => BookInfo.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'data': data,
    };
  }
}

class BookInfo {
  String id;
  String name;
  String year;
  String author;
  String image;
  String description;

  BookInfo({
    required this.id,
    required this.name,
    required this.year,
    required this.author,
    required this.image,
    required this.description,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) {
    return BookInfo(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      author: json['author'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'author': author,
      'image': image,
      'description': description,
    };
  }
}
