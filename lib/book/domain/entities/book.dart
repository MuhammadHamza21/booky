// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String imageUrl;
  final String bookId;
  final String title;
  final String authors;
  final String pages;
  final String publisher;
  final String language;
  final String year;
  const Book({
    required this.imageUrl,
    required this.bookId,
    required this.title,
    required this.authors,
    required this.pages,
    required this.publisher,
    required this.language,
    required this.year,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        bookId,
        title,
        authors,
        pages,
        publisher,
        language,
        year,
      ];
}
