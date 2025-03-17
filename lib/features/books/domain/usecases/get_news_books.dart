import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/usecase/usecase.dart';

import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:librery_app/features/books/domain/repositories/book_repository.dart';

typedef UseCaseResponse = Either<BaseError, BookList>;
typedef UseCaseDef = UseCaseNoParams<UseCaseResponse>;

class GetNewBooks implements UseCaseDef {
  GetNewBooks({required BookRepository bookRepository})
      : _bookRepository = bookRepository;

  final BookRepository _bookRepository;

  @override
  Future<UseCaseResponse> call() async {
    final bookList = await _bookRepository.getNewBooks();
    return bookList;
  }
}
