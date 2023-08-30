import 'package:bloc/bloc.dart';
import 'package:busy_reader/core/error/failures.dart';
import 'package:busy_reader/core/usecases/usecase.dart';

import './bloc.dart';
import '../../domain/usecases/get_book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBook getBook;

  BookBloc({
    required GetBook book,
  })  : getBook = book,
        super(EmptyState()) {
    on<BookEvent>((event, emit) async {
      if (event is GetBookEvent) {
        emit(LoadingState());
        final failureOrBook = await getBook(NoParams());
        failureOrBook.fold(
            (failure) =>
                emit(ErrorState(message: _mapFailureToMessage(failure))),
            (book) => emit(LoadedState(book: book)));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected error';
    }
  }
}
