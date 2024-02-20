part of 'book_cubit.dart';

class BookState extends Equatable {
  const BookState({
    this.gettingBooksState = RequestState.initial,
  });
  final RequestState gettingBooksState;

  @override
  List<Object> get props => [gettingBooksState];

  BookState copyWith({
    RequestState? gettingBooksState,
  }) =>
      BookState(
        gettingBooksState: gettingBooksState ?? this.gettingBooksState,
      );
}

final class BookInitial extends BookState {}
