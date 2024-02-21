import 'package:booky/book/data/data_source/remote_data_source.dart';
import 'package:booky/book/data/repository/book_repository.dart';
import 'package:booky/book/domain/repository/base_book_repository.dart';
import 'package:booky/book/domain/usecases/get_books.dart';
import 'package:booky/book/domain/usecases/get_chapters.dart';
import 'package:booky/book/presentation/controller/book_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // repositories
    sl.registerLazySingleton<BaseBookRepository>(
        () => BookRepository(baseBookRemoteDatasource: sl()));
    // datasources
    sl.registerLazySingleton<BaseBookRemoteDatasource>(
        () => BookRemoteDatsource());
    // bloc
    sl.registerFactory(() => BookCubit(sl(), sl()));
    // usecases
    sl.registerLazySingleton(() => GetBooksUsecase(baseBookRepository: sl()));
    sl.registerLazySingleton(
        () => GetChaptersUsecase(baseBookRepository: sl()));
  }
}
