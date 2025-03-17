import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:librery_app/features/books/domain/entities/book/book.dart';

part 'book_detail.freezed.dart';

@freezed
class BookDetail with _$BookDetail {
  const factory BookDetail({
    required final String error,
    required final Book book,
    required final String authors,
    required final String publisher,
    required final String language,
    required final String isbn10,
    required final String pages,
    required final String year,
    required final String rating,
    required final String description,
  }) = _BookDetail;

  factory BookDetail.empty() => BookDetail(
        error: '',
        book: Book.empty(),
        authors: '',
        publisher: '',
        language: '',
        isbn10: '',
        pages: '0',
        year: '0',
        rating: '0',
        description: '',
      );
}
