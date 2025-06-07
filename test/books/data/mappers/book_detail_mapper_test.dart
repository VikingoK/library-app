import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:librery_app/features/books/data/mappers/book_detail/book_detail_mapper.dart';
import 'package:librery_app/features/books/data/models/book_detail/book_detail_model.dart';

void main() {
  late BookDetailMapper bookDetailMapper;

  setUp(() {
    bookDetailMapper = BookDetailMapper();
  });

  test('It should correctly map BookDetailModel to BookDetail', () {
    // Arrange
    final bookDetailModelJson = '''
      {
        "error": "0",
        "title": "Flutter UI Succinctly",
        "subtitle": "",
        "authors": "Ed Freitas",
        "publisher": "Syncfusion",
        "language": "English",
        "isbn10": "1642002194",
        "isbn13": "9781642002195",
        "pages": "125",
        "year": "2021",
        "rating": "0",
        "desc": "Flutter made quite the impact when it landed in the cross-platform mobile framework landscape. Developed by Google, open source, targeting iOS and Android, smooth animations and motion, platform awareness, hot reload - the list of highlights goes on and on, demonstrating why Flutter is a worth any m...",
        "price": "\$0.00",
        "image": "https://itbook.store/img/books/9781642002195.png",
        "url": "https://itbook.store/books/9781642002195",
        "pdf": {
          "Free eBook": "https://www.dbooks.org/d/1642002194-1650967385-32eaac9e4185d07b/"
          }
      }
      ''';

    final Map<String, dynamic> jsonMap = jsonDecode(bookDetailModelJson);
    final bookDetailModel = BookDetailModel.fromJson(jsonMap);

    // Act
    final bookDetail = bookDetailMapper.toEntity(bookDetailModel);

    // Assert
    expect(bookDetail.error, bookDetailModel.error);
    expect(bookDetail.book.title, bookDetailModel.title);
    expect(bookDetail.book.subtitle, bookDetailModel.subtitle);
    expect(bookDetail.book.isbn13, bookDetailModel.isbn13);
    expect(bookDetail.book.price, bookDetailModel.price);
    expect(bookDetail.book.image, bookDetailModel.image);
    expect(bookDetail.book.url, bookDetailModel.url);
    expect(bookDetail.authors, bookDetailModel.authors);
    expect(bookDetail.publisher, bookDetailModel.publisher);
    expect(bookDetail.language, bookDetailModel.language);
    expect(bookDetail.isbn10, bookDetailModel.isbn10);
    expect(bookDetail.pages, bookDetailModel.pages);
    expect(bookDetail.year, bookDetailModel.year);
    expect(bookDetail.rating, bookDetailModel.rating);
    expect(bookDetail.description, bookDetailModel.desc);
  });

  test('It should throw an error when BookDetailModel has null values', () {
    // Arrange
    final bookDetailModelJson = '''
      {
        "error": null,
        "title": null,
        "subtitle": null,
        "authors": null,
        "publisher": "Syncfusion",
        "language": "English",
        "isbn10": "1642002194",
        "isbn13": "9781642002195",
        "pages": "125",
        "year": "2021",
        "rating": "0",
        "desc": "Flutter made quite the impact when it landed in the cross-platform mobile framework landscape. Developed by Google, open source, targeting iOS and Android, smooth animations and motion, platform awareness, hot reload - the list of highlights goes on and on, demonstrating why Flutter is a worth any m...",
        "price": null,
        "image": "https://itbook.store/img/books/9781642002195.png",
        "url": "https://itbook.store/books/9781642002195",
        "pdf": {
          "Free eBook": "https://www.dbooks.org/d/1642002194-1650967385-32eaac9e4185d07b/"
          }
      }
      ''';

    // Act
    final Map<String, dynamic> jsonMap = jsonDecode(bookDetailModelJson);
    final bookDetailModel = BookDetailModel.fromJson(jsonMap);

    // Act & Assert
    expect(
      () => bookDetailMapper.toEntity(bookDetailModel),
      throwsA(isA<TypeError>()),
    );
  });
}
