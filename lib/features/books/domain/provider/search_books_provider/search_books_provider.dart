import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/data/provider/data_providers.dart';
import 'package:librery_app/features/books/domain/usecases/search_books.dart';

part 'search_books_provider.g.dart';

@riverpod
SearchBooks searchBooksUseCase(Ref ref) {
  final repository = ref.watch(bookRepositoryImplProvider);
  final useCase = SearchBooks(bookRepository: repository);
  return useCase;
}
