import 'package:booky/book/domain/entities/book.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 219, 219, 219),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Image.network(
          book.imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
