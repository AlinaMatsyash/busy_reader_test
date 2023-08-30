import 'package:busy_reader/features/books/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/book_repository.dart';

class GetBook implements UseCase<BookModel, NoParams> {
  final BookRepository repository;

  GetBook(this.repository);

  @override
  Future<Either<Failure, BookModel>> call(NoParams params) async {
    return await repository.getBook();
  }
}