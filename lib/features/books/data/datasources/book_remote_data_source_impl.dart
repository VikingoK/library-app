import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/network/dio_http_client.dart';
import 'package:librery_app/features/books/data/datasources/book_remote_data_source.dart';

import 'package:librery_app/features/books/data/models/book_detail/book_detail_model.dart';
import 'package:librery_app/features/books/data/models/book_list/book_list_model.dart';

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  BookRemoteDataSourceImpl({required DioHttpClient dioHttpClient})
      : _dioHttpClient = dioHttpClient;

  final DioHttpClient _dioHttpClient;

  @override
  Future<Either<BaseError, BookListModel>> searchBooks(String query) async {
    final endpoint = '/search/${query.toLowerCase()}';

    final modelResponse =
        await _dioHttpClient.getRequest<BaseError, BookListModel>(
            endpoint: endpoint,
            builder: (bookListModel) => BookListModel.fromJson(bookListModel));

    if (modelResponse.isLeft) return Left(modelResponse.left);

    return Right(modelResponse.right);
  }

  @override
  Future<Either<BaseError, BookListModel>> getNewBooks() async {
    final endpoint = '/new';

    final modelResponse = await _dioHttpClient.getRequest(
        endpoint: endpoint,
        builder: (bookListModel) => BookListModel.fromJson(bookListModel));

    if (modelResponse.isLeft) return Left(modelResponse.left);

    return Right(modelResponse.right);
  }

  @override
  Future<Either<BaseError, BookDetailModel>> getBookDetail(String code) async {
    final endpoint = '/books/$code';

    final modelResponse = await _dioHttpClient.getRequest(
        endpoint: endpoint,
        builder: (bookDetailModel) =>
            BookDetailModel.fromJson(bookDetailModel));

    if (modelResponse.isLeft) return Left(modelResponse.left);

    return Right(modelResponse.right);
  }
}
