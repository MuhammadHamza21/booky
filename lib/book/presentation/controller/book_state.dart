part of 'book_cubit.dart';

class BookState extends Equatable {
  const BookState({
    this.gettingBooksState = RequestState.initial,
    this.gettingChaptersState = RequestState.initial,
  });
  final RequestState gettingBooksState;
  final RequestState gettingChaptersState;

  @override
  List<Object> get props => [gettingBooksState, gettingChaptersState];

  BookState copyWith({
    RequestState? gettingBooksState,
    RequestState? gettingChaptersState,
  }) =>
      BookState(
        gettingBooksState: gettingBooksState ?? this.gettingBooksState,
        gettingChaptersState: gettingChaptersState ?? this.gettingChaptersState,
      );
}

final class BookInitial extends BookState {}
