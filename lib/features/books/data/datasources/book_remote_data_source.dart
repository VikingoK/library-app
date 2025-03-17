import 'package:either_dart/either.dart';

import 'package:librery_app/core/errors/base_error.dart';

import 'package:librery_app/features/books/data/models/book_detail/book_detail_model.dart';
import 'package:librery_app/features/books/data/models/book_list/book_list_model.dart';

abstract class BookRemoteDataSource {
  Future<Either<BaseError, BookListModel>> searchBooks(String query);
  Future<Either<BaseError, BookListModel>> getNewBooks();
  Future<Either<BaseError, BookDetailModel>> getBookDetail(String code);
}
