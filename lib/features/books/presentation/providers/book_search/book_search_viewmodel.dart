import 'dart:async';

import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:librery_app/features/books/domain/provider/search_books_provider/search_books_provider.dart';
import 'package:librery_app/features/books/presentation/providers/recent_search/recent_search_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/presentation/providers/book_search/book_search_state.dart';

part 'book_search_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class BookSearchViewmodel extends _$BookSearchViewmodel {
  Timer? _debounce;

  @override
  BookSearchState build() {
    ref.onDispose(() {
      _debounce?.cancel();
    });

    return BookSearchState.empty();
  }

  debounceChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    state = state.copyWith(isLoading: true);

    _debounce = Timer(const Duration(milliseconds: 400), () {
      searchBooks(query);
    });
  }

  void searchBooks(String? query) async {
    if (query == null || query.isEmpty) {
      state = state.copyWith(
          isLoading: false, isError: false, resultSearch: BookList.empty());
      return;
    }

    if (query.length >= 2) {
      ref.read(recentSearchProvider.notifier).addSearch(query);
    }

    final useCase = ref.read(searchBooksUseCaseProvider);
    final useCaseResponse = await useCase.call(params: (query: query));

    state = state.copyWith(
      isLoading: false,
      isError: useCaseResponse.isLeft,
      query: query,
      resultSearch:
          useCaseResponse.isRight ? useCaseResponse.right : BookList.empty(),
    );
  }
}
