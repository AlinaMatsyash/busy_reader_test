import 'package:busy_reader/features/books/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class BookRepository {
  Future<Either<Failure, BookModel>> getBook();
}
