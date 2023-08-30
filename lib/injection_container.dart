import 'package:busy_reader/features/books/data/datasources/book_remote_data_source.dart';
import 'package:busy_reader/features/books/data/repositories/book_repository_impl.dart';
import 'package:busy_reader/features/books/domain/repositories/book_repository.dart';
import 'package:busy_reader/features/books/domain/usecases/get_book.dart';
import 'package:busy_reader/features/books/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => BookBloc(
      book: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetBook(sl()));

  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  var box = Hive.openBox('myBox');
  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
