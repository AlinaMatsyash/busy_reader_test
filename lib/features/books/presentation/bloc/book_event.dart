import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBookEvent extends BookEvent {}
