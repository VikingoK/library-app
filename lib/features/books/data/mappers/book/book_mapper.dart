import 'package:librery_app/core/mappers/model_to_entity_mapper.dart';

import 'package:librery_app/features/books/data/models/book/book_model.dart';
import 'package:librery_app/features/books/domain/entities/book/book.dart';

class BookMapper extends ModelToEntityMapper<Book, BookModel> {
  @override
  Book toEntity(BookModel model) {
    return Book(
      title: model.title,
      subtitle: model.subtitle,
      isbn13: model.isbn13,
      price: model.price,
      image: model.image,
      url: model.url,
    );
  }
}
