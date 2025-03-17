import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';

part 'book_search_state.freezed.dart';

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState({
    required final String query,
    required final bool isLoading,
    required final bool isError,
    required final BookList resultSearch,
  }) = _BookSearchState;

  factory BookSearchState.empty() => BookSearchState(
        query: '',
        isLoading: false,
        isError: false,
        resultSearch: BookList.empty(),
      );
}
