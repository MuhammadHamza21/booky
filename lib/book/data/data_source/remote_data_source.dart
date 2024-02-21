import 'package:booky/app_constants.dart';
import 'package:booky/book/data/models/book_model.dart';

abstract class BaseBookRemoteDatasource {
  Future<List<BookModel>> getBooks();
  Future<List<BookModel>> getChapters();
}

class BookRemoteDatsource extends BaseBookRemoteDatasource {
  @override
  Future<List<BookModel>> getBooks() async {
    await Future.delayed(const Duration(seconds: 2));
    return booksList.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookModel>> getChapters() async {
    await Future.delayed(const Duration(seconds: 2));
    return chaptersList.map((e) => BookModel.fromJson(e)).toList();
  }
}
