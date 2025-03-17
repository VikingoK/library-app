import 'package:librery_app/features/books/domain/provider/get_book_detail/get_book_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/domain/entities/book_detail/book_detail.dart';
import 'package:librery_app/features/books/presentation/providers/book_detail/book_detail_state.dart';

part 'book_detail_viewmodel.g.dart';

@riverpod
class BookDetailViewmodel extends _$BookDetailViewmodel {
  @override
  BookDetailState build() => BookDetailState.empty();

  void getBookDetail(String code) async {
    state = state.copyWith(isLoading: true);

    final useCase = ref.read(getBookDetailUseCaseProvider);
    final useCaseResponse = await useCase.call(params: (code: code));

    state = state.copyWith(
      isLoading: false,
      isError: useCaseResponse.isLeft,
      resultSearch:
          useCaseResponse.isRight ? useCaseResponse.right : BookDetail.empty(),
    );
  }
}
