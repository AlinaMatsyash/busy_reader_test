import 'package:busy_reader/features/books/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int count;
  final List<BookInfo> data;

  const Book({
    required this.count,
    required this.data,
  });

  @override
  List<Object> get props => [count, data];
}
