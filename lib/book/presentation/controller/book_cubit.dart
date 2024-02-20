// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:booky/book/domain/entities/book.dart';
import 'package:booky/core/error/failures/failures.dart';
import 'package:booky/core/usecases/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booky/book/domain/usecases/get_books.dart';
import 'package:booky/core/utils/enums.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit(
    this.getBooksUsecase,
  ) : super(BookInitial());
  static BookCubit get(BuildContext context) => BlocProvider.of(context);
  final GetBooksUsecase getBooksUsecase;
  List<Book> booksList = [];

  FutureOr<void> getBooks() async {
    emit(state.copyWith(gettingBooksState: RequestState.loading));
    var result = await getBooksUsecase(NoParams());
    result.fold(
      (l) {
        if (l is ServerFailure) {
          emit(state.copyWith(gettingBooksState: RequestState.error));
        } else if (l is OfflineFailure) {
          emit(state.copyWith(gettingBooksState: RequestState.offline));
        }
      },
      (r) {
        booksList = r;
        emit(state.copyWith(gettingBooksState: RequestState.loaded));
      },
    );
  }
}
