import 'package:busy_reader/features/books/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book_remote_data_source.dart';


class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BookModel>> getBook() async {
    return await _getBook(() {
      return remoteDataSource.getBook();
    });
  }

  Future<Either<Failure, BookModel>> _getBook(
    get,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBook = await get();
        return Right(remoteBook);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
        return Left(ServerFailure());
    }
  }
}
