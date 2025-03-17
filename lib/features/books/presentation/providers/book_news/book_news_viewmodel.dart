import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:librery_app/features/books/domain/provider/get_new_books_provider/get_new_books_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/presentation/providers/book_news/book_news_state.dart';

part 'book_news_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class BookNewsViewmodel extends _$BookNewsViewmodel {
  @override
  BookNewsState build() => BookNewsState.empty();

  void getNewsBooks() async {
    state = state.copyWith(isLoading: true);

    final useCase = ref.read(getNewBooksUseCaseProvider);
    final useCaseResponse = await useCase.call();

    state = state.copyWith(
      isLoading: false,
      isError: useCaseResponse.isLeft,
      resultNews:
          useCaseResponse.isRight ? useCaseResponse.right : BookList.empty(),
    );
  }
}
