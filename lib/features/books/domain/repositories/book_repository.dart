import 'package:either_dart/either.dart';

import 'package:librery_app/core/errors/base_error.dart';

import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';

abstract class BookRepository {
  Future<Either<BaseError, BookList>> searchBooks(String query);
  Future<Either<BaseError, BookList>> getNewBooks();
  Future<Either<BaseError, BookDetail>> getBookDetail(String code);
}
