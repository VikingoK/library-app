import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/widgets/search_redirect_bar.dart';
import 'package:librery_app/features/books/presentation/widgets/sliver_grid_book_news.dart';
import 'package:librery_app/features/books/presentation/widgets/text_with_logo.dart';
import 'package:librery_app/features/books/presentation/providers/book_news/book_news_viewmodel.dart';
import 'package:librery_app/features/books/presentation/widgets/recent_searchs.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(bottom: false, child: _MainScroll()));
  }
}

class _MainScroll extends ConsumerStatefulWidget {
  const _MainScroll();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __MainScrollState();
}

class __MainScrollState extends ConsumerState<_MainScroll> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadNewsBooks();
    });
  }

  loadNewsBooks() {
    ref.read(bookNewsViewmodelProvider.notifier).getNewsBooks();
  }

  @override
  Widget build(BuildContext context) {
    const double paddingView = 15;

    final stateNews = ref.watch(bookNewsViewmodelProvider);
    final newsBooks = stateNews.resultNews.books;

    return Skeletonizer(
      enabled: stateNews.isLoading,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderHomeDelegate(paddingView: paddingView),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
                left: paddingView, right: paddingView, top: 30, bottom: 5),
            child: AutoSizeText('New release',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.softWhite,
                    fontVariations: FontVariations.semiBold)),
          )),
          SliverGridBookNews(
              newsBooks: newsBooks, isLoading: stateNews.isLoading),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 70,
            ),
          )
        ],
      ),
    );
  }
}

class _StickyHeaderHomeDelegate extends SliverPersistentHeaderDelegate {
  const _StickyHeaderHomeDelegate({required this.paddingView});

  final double paddingView;

  @override
  double get minExtent => 325;
  @override
  double get maxExtent => 325;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double paddingTop = 22;

    return Container(
      height: maxExtent,
      color: AppColors.darkBackground,
      padding: EdgeInsets.only(bottom: paddingView, top: paddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWithLogo(paddingTop: paddingTop, paddingView: paddingView),
          SearchRedirectBar(paddingView: paddingView),
          RecentSearchs(paddingView: paddingView)
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
