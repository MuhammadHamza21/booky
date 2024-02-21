// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booky/book/presentation/controller/book_cubit.dart';
import 'package:booky/book/presentation/screens/book_content_screen.dart';
import 'package:booky/book/presentation/widgets/book_widget.dart';
import 'package:booky/core/methods/navigate_to.dart';
import 'package:booky/core/utils/enums.dart';

class ChaptersScreen extends StatefulWidget {
  const ChaptersScreen({
    Key? key,
    required this.bookId,
  }) : super(key: key);
  final String bookId;

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  @override
  void initState() {
    BookCubit.get(context).getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          final bookCubit = BookCubit.get(context);
          if (state.gettingChaptersState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.gettingChaptersState == RequestState.error ||
              state.gettingChaptersState == RequestState.offline) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state.gettingChaptersState == RequestState.loaded) {
            if (bookCubit.chaptersList.isEmpty) {
              return const Center(
                child: Text("This Book hasn't chapters"),
              );
            } else {
              return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.3,
                children: List.generate(
                  bookCubit.booksList.length,
                  (index) => BookWidget(
                    book: bookCubit.chaptersList[index],
                    onTap: () {
                      navigateTo(
                        context,
                        const BookContentScreen(),
                      );
                    },
                  ),
                ),
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
