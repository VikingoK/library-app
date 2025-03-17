import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/features/books/data/datasources/book_remote_data_source.dart';
import 'package:librery_app/features/books/domain/repositories/book_repository.dart';

import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:librery_app/features/books/data/mappers/book_list/book_list_mapper.dart';

import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';
import 'package:librery_app/features/books/data/mappers/book_detail/book_detail_mapper.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl({required BookRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final BookRemoteDataSource _remoteDataSource;

  @override
  Future<Either<BaseError, BookList>> searchBooks(String query) async {
    final modelResponse = await _remoteDataSource.searchBooks(query);
    if (modelResponse.isLeft) return Left(modelResponse.left);

    final paginatedBookList = BookListMapper().toEntity(modelResponse.right);
    return Right(paginatedBookList);
  }

  @override
  Future<Either<BaseError, BookList>> getNewBooks() async {
    final modelResponse = await _remoteDataSource.getNewBooks();
    if (modelResponse.isLeft) return Left(modelResponse.left);

    final bookList = BookListMapper().toEntity(modelResponse.right);
    return Right(bookList);
  }

  @override
  Future<Either<BaseError, BookDetail>> getBookDetail(String code) async {
    final modelResponse = await _remoteDataSource.getBookDetail(code);
    if (modelResponse.isLeft) return Left(modelResponse.left);

    final bookDetail = BookDetailMapper().toEntity(modelResponse.right);
    return Right(bookDetail);
  }
}
