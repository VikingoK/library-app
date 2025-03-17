import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/providers/book_detail/book_detail_viewmodel.dart';
import 'package:librery_app/features/books/presentation/widgets/book_description.dart';
import 'package:librery_app/features/books/presentation/widgets/book_header.dart';
import 'package:librery_app/features/books/presentation/widgets/book_metadata.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            'Detail book',
            style: TextStyle(
                fontVariations: FontVariations.semiBold, fontSize: 19),
          ),
          backgroundColor: AppColors.darkBackground,
        ),
        backgroundColor: AppColors.darkBackground,
        body: _MainScroll(
          code: code,
        ));
  }
}

class _MainScroll extends ConsumerStatefulWidget {
  const _MainScroll({required this.code});

  final String code;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __MainScrollState();
}

class __MainScrollState extends ConsumerState<_MainScroll> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadDetailBook();
    });
  }

  loadDetailBook() {
    ref.read(bookDetailViewmodelProvider.notifier).getBookDetail(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    const double paddingView = 15;

    final stateBookDetail = ref.watch(bookDetailViewmodelProvider);
    final detailBook = stateBookDetail.resultSearch;
    final infoBook = detailBook.book;

    return SingleChildScrollView(
      child: Skeletonizer(
        enabled: stateBookDetail.isLoading,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: paddingView),
          child: Column(
            children: [
              BookHeader(
                title: infoBook.title,
                subtitle: infoBook.subtitle,
                price: infoBook.price,
                imageUrl: infoBook.image,
              ),
              BookMetadata(
                numberOfPages: detailBook.pages,
                rating: detailBook.rating,
                year: detailBook.year,
                paddingView: paddingView,
                websiteUrl: infoBook.url,
              ),
              BookDescription(
                  description: detailBook.description,
                  paddingView: paddingView),
            ],
          ),
        ),
      ),
    );
  }
}
