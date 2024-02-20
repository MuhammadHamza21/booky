// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:booky/book/data/data_source/remote_data_source.dart';
import 'package:booky/book/domain/entities/book.dart';
import 'package:booky/book/domain/repository/base_book_repository.dart';
import 'package:booky/core/error/failures/failures.dart';
import 'package:booky/core/usecases/base_usecase.dart';

class BookRepository extends BaseBookRepository {
  final BaseBookRemoteDatasource baseBookRemoteDatasource;
  BookRepository({
    required this.baseBookRemoteDatasource,
  });
  @override
  Future<Either<Failure, List<Book>>> getBooks(NoParams params) async {
    var result = await baseBookRemoteDatasource.getBooks();
    return Right(result);
  }
}
