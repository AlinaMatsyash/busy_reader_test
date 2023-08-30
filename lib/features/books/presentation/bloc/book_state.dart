import 'package:busy_reader/features/books/domain/entities/book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends BookState {}

class LoadingState extends BookState {}

class LoadedState extends BookState {
  final Book book;

  LoadedState({required this.book});

  @override
  List<Object> get props => [book];
}

class ErrorState extends BookState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
