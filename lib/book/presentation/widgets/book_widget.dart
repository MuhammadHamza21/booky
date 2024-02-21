// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:booky/book/domain/entities/book.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  final Book book;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
