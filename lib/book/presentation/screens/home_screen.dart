import 'package:booky/book/presentation/controller/book_cubit.dart';
import 'package:booky/book/presentation/widgets/book_widget.dart';
import 'package:booky/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
      ),
      body: BlocBuilder<BookCubit, BookState>(builder: (context, state) {
        final bookCubit = BookCubit.get(context);
        if (state.gettingBooksState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.gettingBooksState == RequestState.error ||
            state.gettingBooksState == RequestState.offline) {
          return const Text("Error");
        } else if (state.gettingBooksState == RequestState.loaded) {
          if (BookCubit.get(context).booksList.isEmpty) {
            return const Text("Empty");
          } else {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.3,
              children: List.generate(
                bookCubit.booksList.length,
                (index) => BookWidget(book: bookCubit.booksList[index]),
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
