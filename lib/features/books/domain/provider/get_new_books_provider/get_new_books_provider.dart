import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/data/provider/data_providers.dart';
import 'package:librery_app/features/books/domain/usecases/get_news_books.dart';

part 'get_new_books_provider.g.dart';

@riverpod
GetNewBooks getNewBooksUseCase(Ref ref) {
  final repository = ref.watch(bookRepositoryImplProvider);
  final useCase = GetNewBooks(bookRepository: repository);
  return useCase;
}
