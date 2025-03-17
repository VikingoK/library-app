import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/core/providers/host_providers.dart';

import 'package:librery_app/features/books/data/datasources/book_remote_data_source_impl.dart';
import 'package:librery_app/features/books/data/repositories/book_repository_impl.dart';

part 'data_providers.g.dart';

@riverpod
BookRemoteDataSourceImpl bookRemoteDetailUseCase(Ref ref) {
  final bookremoteDataSourceImpl = BookRemoteDataSourceImpl(
      dioHttpClient: ref.watch(apiServiceBooksProvider));
  return bookremoteDataSourceImpl;
}

@riverpod
BookRepositoryImpl bookRepositoryImpl(Ref ref) {
  final bookRemoteDataSource = ref.watch(bookRemoteDetailUseCaseProvider);
  final bookRepositoryImpl =
      BookRepositoryImpl(remoteDataSource: bookRemoteDataSource);
  return bookRepositoryImpl;
}
