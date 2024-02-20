// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:booky/book/domain/entities/book.dart';
import 'package:booky/book/domain/repository/base_book_repository.dart';
import 'package:booky/core/error/failures/failures.dart';
import 'package:booky/core/usecases/base_usecase.dart';

class GetBooksUsecase extends BaseUsecase<List<Book>, NoParams> {
  final BaseBookRepository baseBookRepository;
  GetBooksUsecase({
    required this.baseBookRepository,
  });
  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) async {
    return await baseBookRepository.getBooks(params);
  }
}
