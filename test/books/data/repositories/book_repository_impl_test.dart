import 'package:flutter_test/flutter_test.dart';

import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/errors/server_error.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:librery_app/features/books/data/repositories/book_repository_impl.dart';
import 'package:librery_app/features/books/domain/entities/book/book.dart';

import 'book_repository_impl_test.mocks.dart';

@GenerateMocks([BookRepositoryImpl])
void main() {
  late MockBookRepositoryImpl bookRepositoryImpl;

  setUpAll(() {
    provideDummy<Either<BaseError, BookList>>(
        Right(BookList(error: '', total: '', books: [])));
  });

  setUp(() {
    bookRepositoryImpl = MockBookRepositoryImpl();
  });

  test('It should retrieve a list of new books from the repository.', () async {
    final bookList = [
      Book(
        title: "An Introduction to C & GUI Programming, 2nd Edition",
        subtitle: "",
        isbn13: "9781912047451",
        price: "\$12.94",
        image: "https://itbook.store/img/books/9781912047451.png",
        url: "https://itbook.store/books/9781912047451",
      ),
      Book(
          title: "Snowflake: The Definitive Guide",
          subtitle:
              "Architecting, Designing, and Deploying on the Snowflake Data Cloud",
          isbn13: "9781098103828",
          price: "\$58.90",
          image: "https://itbook.store/img/books/9781098103828.png",
          url: "https://itbook.store/books/9781098103828")
    ];
    // Arrange
    final BookList books = BookList(error: '0', total: '2', books: bookList);

    when(bookRepositoryImpl.getNewBooks())
        .thenAnswer((_) async => Right(books));

    // Act
    final result = await bookRepositoryImpl.getNewBooks();

    // Assert
    expect(result, Right(books));
    verify(bookRepositoryImpl.getNewBooks()).called(1);
  });

  test('It should return an error when the repository fails to retrieve books.',
      () async {
    // Arrange:
    final error = ServerError(errorDescription: "Failed to fetch books");

    when(bookRepositoryImpl.getNewBooks()).thenAnswer((_) async => Left(error));

    // Act
    final result = await bookRepositoryImpl.getNewBooks();

    // Assert
    expect(result, Left(error));
    verify(bookRepositoryImpl.getNewBooks()).called(1);
  });

  test('It should retrieve a list of search books from the repository.',
      () async {
    final bookList = [
      Book(
        title: "An Introduction to C & GUI Programming, 2nd Edition",
        subtitle: "",
        isbn13: "9781912047451",
        price: "\$12.94",
        image: "https://itbook.store/img/books/9781912047451.png",
        url: "https://itbook.store/books/9781912047451",
      ),
      Book(
          title: "Snowflake: The Definitive Guide",
          subtitle:
              "Architecting, Designing, and Deploying on the Snowflake Data Cloud",
          isbn13: "9781098103828",
          price: "\$58.90",
          image: "https://itbook.store/img/books/9781098103828.png",
          url: "https://itbook.store/books/9781098103828")
    ];
    const query = 'an';

    // Arrange
    final BookList books = BookList(error: '0', total: '2', books: bookList);

    when(bookRepositoryImpl.searchBooks(query))
        .thenAnswer((_) async => Right(books));

    // Act
    final result = await bookRepositoryImpl.searchBooks(query);

    // Assert
    expect(result, Right(books));
    verify(bookRepositoryImpl.searchBooks(query)).called(1);
  });
}
