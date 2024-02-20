import 'package:booky/book/domain/entities/book.dart';
import 'package:booky/core/error/failures/failures.dart';
import 'package:booky/core/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBookRepository {
  Future<Either<Failure, List<Book>>> getBooks(NoParams params);
}
