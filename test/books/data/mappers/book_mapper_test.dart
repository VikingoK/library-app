import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:librery_app/features/books/data/mappers/book/book_mapper.dart';
import 'package:librery_app/features/books/data/models/book/book_model.dart';

void main() {
  late BookMapper bookMapper;

  setUp(() {
    bookMapper = BookMapper();
  });

  test('It should correctly map BookModel to Book', () {
    // Arrange
    final bookModelJson = '''
      {
        "title": "Plug-In PHP: 100 Power Solutions",
        "subtitle": "Simple Solutions to Practical PHP Problems",
        "isbn13": "9780071666596",
        "price": "\$4.98",
        "image": "https://itbook.store/img/books/9780071666596.png",
        "url": "https://itbook.store/books/9780071666596"
      }
      ''';

    // Act
    final Map<String, dynamic> jsonMap = jsonDecode(bookModelJson);
    final bookModel = BookModel.fromJson(jsonMap);

    final book = bookMapper.toEntity(bookModel);

    // Assert
    expect(book.title, bookModel.title);
    expect(book.subtitle, bookModel.subtitle);
    expect(book.isbn13, bookModel.isbn13);
    expect(book.price, bookModel.price);
    expect(book.image, bookModel.image);
    expect(book.url, bookModel.url);
  });

  test('It should throw an error when BookModel has null values', () {
    // Arrange
    final bookModelJson = '''
      {
        "title": null,
        "subtitle": "Simple Solutions to Practical PHP Problems",
        "isbn13": null,
        "price": null,
        "image": "https://itbook.store/img/books/9780071666596.png",
        "url": "https://itbook.store/books/9780071666596"
      }
      ''';

    // Act
    final Map<String, dynamic> jsonMap = jsonDecode(bookModelJson);
    final bookModel = BookModel.fromJson(jsonMap);

    // Act & Assert
    expect(() => bookMapper.toEntity(bookModel), throwsA(isA<TypeError>()));
  });
}
