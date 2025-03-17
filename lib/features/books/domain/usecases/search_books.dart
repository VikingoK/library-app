import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/usecase/usecase.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';

import 'package:librery_app/features/books/domain/repositories/book_repository.dart';

typedef UseCaseResponse = Either<BaseError, BookList>;
typedef UseCaseDef = UseCase<UseCaseResponse, ({String query})>;

class SearchBooks implements UseCaseDef {
  SearchBooks({required BookRepository bookRepository})
      : _bookRepository = bookRepository;

  final BookRepository _bookRepository;

  @override
  Future<UseCaseResponse> call({required params}) async {
    final paginatedBookList = await _bookRepository.searchBooks(params.query);
    return paginatedBookList;
  }
}
