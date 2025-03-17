import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/features/books/data/provider/data_providers.dart';
import 'package:librery_app/features/books/domain/usecases/get_book_detail.dart';

part 'get_book_detail_provider.g.dart';

@riverpod
GetBookDetail getBookDetailUseCase(Ref ref) {
  final repository = ref.watch(bookRepositoryImplProvider);
  final useCase = GetBookDetail(bookRepository: repository);
  return useCase;
}
