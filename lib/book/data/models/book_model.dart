import 'package:booky/book/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel(
      {required super.imageUrl,
      required super.bookId,
      required super.title,
      required super.authors,
      required super.pages,
      required super.publisher,
      required super.language,
      required super.year});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        imageUrl: json["imgUrl"],
        bookId: json["bookId"],
        title: json["title"],
        authors: json["authors"],
        pages: json["pages"],
        publisher: json["publisher"],
        language: json["language"],
        year: json["year"],
      );
}
