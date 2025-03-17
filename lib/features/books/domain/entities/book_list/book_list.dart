import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:librery_app/features/books/domain/entities/book/book.dart';

part 'book_list.freezed.dart';

@freezed
class BookList with _$BookList {
  const factory BookList({
    required final String error,
    required final String total,
    required final List<Book> books,
  }) = _BookList;

  factory BookList.empty() => BookList(
        error: '',
        total: '',
        books: [],
      );
}
