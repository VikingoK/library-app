import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';

part 'book_detail_state.freezed.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    required final String code,
    required final bool isLoading,
    required final bool isError,
    required final BookDetail resultSearch,
  }) = _BookDetailState;

  factory BookDetailState.empty() => BookDetailState(
        code: '',
        isLoading: false,
        isError: false,
        resultSearch: BookDetail.empty(),
      );
}
