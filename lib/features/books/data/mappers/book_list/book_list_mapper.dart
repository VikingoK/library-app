import 'package:librery_app/core/mappers/model_to_entity_mapper.dart';
import 'package:librery_app/features/books/data/mappers/book/book_mapper.dart';
import 'package:librery_app/features/books/data/models/book_list/book_list_model.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';

class BookListMapper extends ModelToEntityMapper<BookList, BookListModel> {
  @override
  BookList toEntity(BookListModel model) {
    return BookList(
      error: model.error,
      total: model.total,
      books: model.books
          .map((bookModel) => BookMapper().toEntity(bookModel))
          .toList(),
    );
  }
}
