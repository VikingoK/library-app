import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/usecase/usecase.dart';
import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';
import 'package:librery_app/features/books/domain/repositories/book_repository.dart';

typedef UseCaseResponse = Either<BaseError, BookDetail>;
typedef UseCaseDef = UseCase<UseCaseResponse, ({String code})>;

class GetBookDetail implements UseCaseDef {
  GetBookDetail({required BookRepository bookRepository})
      : _bookRepository = bookRepository;

  final BookRepository _bookRepository;

  @override
  Future<UseCaseResponse> call({required params}) async {
    final bookDetail = await _bookRepository.getBookDetail(params.code);
    return bookDetail;
  }
}
