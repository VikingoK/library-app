import 'package:librery_app/core/mappers/model_to_entity_mapper.dart';
import 'package:librery_app/features/books/data/mappers/book/book_mapper.dart';

import 'package:librery_app/features/books/data/models/book/book_model.dart';
import 'package:librery_app/features/books/data/models/book_detail/book_detail_model.dart';

import 'package:librery_app/features/books/domain/entities/book/book.dart';
import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';

class BookDetailMapper
    extends ModelToEntityMapper<BookDetail, BookDetailModel> {
  @override
  BookDetail toEntity(BookDetailModel model) {
    final Book baseBook = BookMapper().toEntity(BookModel(
        title: model.title,
        subtitle: model.subtitle,
        isbn13: model.isbn13,
        price: model.price,
        image: model.image,
        url: model.url));

    return BookDetail(
      error: model.error,
      book: baseBook,
      authors: model.authors,
      publisher: model.publisher,
      language: model.language,
      isbn10: model.isbn10,
      pages: model.pages,
      year: model.year,
      rating: model.rating,
      description: model.desc,
    );
  }
}
