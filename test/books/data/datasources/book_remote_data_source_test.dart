import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/network/dio_http_client.dart';
import 'package:librery_app/features/books/data/datasources/book_remote_data_source_impl.dart';
import 'package:librery_app/features/books/data/models/book/book_model.dart';
import 'package:librery_app/features/books/data/models/book_list/book_list_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'book_remote_data_source_test.mocks.dart';

@GenerateMocks([DioHttpClient])
void main() {
  late MockDioHttpClient mockDioHttpClient;
  late BookRemoteDataSourceImpl dataSource;

  setUpAll(() {
    provideDummy<Either<BaseError, BookListModel>>(
        Right(BookListModel(error: '', total: '', books: [])));
  });

  setUp(() {
    mockDioHttpClient = MockDioHttpClient();
    dataSource = BookRemoteDataSourceImpl(dioHttpClient: mockDioHttpClient);
  });

  group('searchBooks', () {
    const String query = "flutter";
    final String endpoint = '/search/${query.toLowerCase()}';

    final bookListModel = BookListModel(
      error: '0',
      total: '1',
      books: [
        BookModel(
          title: "Flutter for Beginners",
          subtitle: "Learn cross-platform development",
          isbn13: "9781234567890",
          price: "\$39.99",
          image: "https://example.com/flutter.png",
          url: "https://example.com/flutter",
        ),
      ],
    );

    final baseError = BaseError(errorDescription: "Something went wrong");

    test('should return BookListModel when the call is successful', () async {
      // Arrange
      when(mockDioHttpClient.getRequest<BaseError, BookListModel>(
        endpoint: endpoint,
        builder: anyNamed('builder'),
      )).thenAnswer((_) async => Right(bookListModel));

      // Act
      final result = await dataSource.searchBooks(query);

      // Assert
      expect(result, Right(bookListModel));
      verify(mockDioHttpClient.getRequest<BaseError, BookListModel>(
        endpoint: endpoint,
        builder: anyNamed('builder'),
      )).called(1);
      verifyNoMoreInteractions(mockDioHttpClient);
    });

    test('should return BaseError when the call fails', () async {
      // Arrange
      when(mockDioHttpClient.getRequest<BaseError, BookListModel>(
        endpoint: endpoint,
        builder: anyNamed('builder'),
      )).thenAnswer((_) async => Left(baseError));

      // Act
      final result = await dataSource.searchBooks(query);

      // Assert
      expect(result, equals(Left(baseError)));
      verify(mockDioHttpClient.getRequest<BaseError, BookListModel>(
        endpoint: endpoint,
        builder: anyNamed('builder'),
      )).called(1);
      verifyNoMoreInteractions(mockDioHttpClient);
    });
  });
}
