import 'package:flutter/material.dart';

import 'package:librery_app/features/books/domain/entities/book/book.dart';
import 'package:librery_app/features/books/presentation/widgets/thumbnail_info.dart';

class SliverGridBookNews extends StatelessWidget {
  const SliverGridBookNews({
    super.key,
    required this.newsBooks,
    required this.isLoading,
  });

  final List<Book> newsBooks;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1 / 1.8),
        delegate: SliverChildBuilderDelegate(childCount: newsBooks.length,
            (BuildContext context, int index) {
          final Book book = newsBooks[index];

          return ThumbnailInfo(
            imageUrl: book.image,
            title: book.title,
            subtitle: book.subtitle,
            isLoading: isLoading,
            code: book.isbn13,
          );
        }),
      ),
    );
  }
}
