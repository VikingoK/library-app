import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';

part 'book_news_state.freezed.dart';

@freezed
class BookNewsState with _$BookNewsState {
  const factory BookNewsState({
    required final bool isLoading,
    required final bool isError,
    required final BookList resultNews,
  }) = _BookNewsState;

  factory BookNewsState.empty() => BookNewsState(
        isLoading: false,
        isError: false,
        resultNews: BookList.empty(),
      );
}
