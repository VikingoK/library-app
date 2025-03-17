import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:librery_app/features/books/domain/entities/book/book.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:auto_route/auto_route.dart';
import 'package:librery_app/core/constants/asset_paths.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/features/books/domain/entities/book_list/book_list.dart';
import 'package:librery_app/features/books/presentation/providers/book_search/book_search_viewmodel.dart';

import 'package:librery_app/features/books/presentation/routes/books_router.dart';
import 'package:librery_app/features/books/presentation/widgets/book_result_card.dart';
import 'package:librery_app/features/books/presentation/widgets/book_search_input.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key, this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
          bottom: false,
          child: _MainScroll(
            query: query,
          )),
    );
  }
}

class _MainScroll extends ConsumerStatefulWidget {
  const _MainScroll({this.query});

  final String? query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __MainScrollState();
}

class __MainScrollState extends ConsumerState<_MainScroll> {
  final _focusNodeInput = FocusNode(canRequestFocus: false);
  final _controllerInput = TextEditingController();

  @override
  void initState() {
    super.initState();

    putFocusOnInput();
    setQuerySerch();
  }

  @override
  void dispose() {
    _focusNodeInput.dispose();
    _controllerInput.dispose();

    super.dispose();
  }

  void putFocusOnInput() {
    if (_focusNodeInput.hasFocus) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodeInput.requestFocus();
    });
  }

  void setQuerySerch() {
    final currentSearch = widget.query;
    if (currentSearch == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bookSearchViewmodelProvider.notifier)
          .debounceChanged(currentSearch);

      setState(() {
        _controllerInput.text = currentSearch;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const double spaceBetweenCards = 15;
    const double paddingView = 15;
    const double bottomSpace = 65;

    final stateSearch = ref.watch(bookSearchViewmodelProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingView),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickySearchBarDelegate(
              focusNodeInput: _focusNodeInput,
              controllerInput: _controllerInput,
              onChanged: (String? value) {
                ref
                    .read(bookSearchViewmodelProvider.notifier)
                    .debounceChanged(value);
              },
            ),
          ),
          SliverBookList(
            spaceBetweenCards: spaceBetweenCards,
            resultSearch: stateSearch.resultSearch,
            isLoading: stateSearch.isLoading,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: bottomSpace,
            ),
          ),
        ],
      ),
    );
  }
}

class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickySearchBarDelegate({
    required this.focusNodeInput,
    required this.controllerInput,
    required this.onChanged,
  });

  final FocusNode focusNodeInput;
  final TextEditingController controllerInput;
  final Function(String)? onChanged;

  @override
  double get minExtent => 70;
  @override
  double get maxExtent => 70;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: AppColors.darkBackground,
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSplashButton(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Icon(Icons.arrow_back_ios_new_rounded))),
          Expanded(
            child: InputField(
                focusNode: focusNodeInput,
                hintText: 'Search book...',
                controller: controllerInput,
                capitalizedWords: true,
                suffix: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(AssetPaths.searchImage,
                        fit: BoxFit.contain)),
                onChanged: onChanged),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class SliverBookList extends ConsumerWidget {
  const SliverBookList({
    super.key,
    required this.spaceBetweenCards,
    required this.resultSearch,
    required this.isLoading,
  });

  final double spaceBetweenCards;
  final BookList resultSearch;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: math.max(0, resultSearch.books.length * 2 - 1),
          (BuildContext context, int index) {
        final int itemIndex = index ~/ 2;
        if (index.isEven) {
          final Book currentBook = resultSearch.books[itemIndex];

          return Skeletonizer(
            enabled: isLoading,
            child: BookResultCard(
              title: currentBook.title,
              subtitle: currentBook.subtitle,
              price: currentBook.price,
              imageUrl: currentBook.image,
              onTap: () {
                context.router.push(DetailRoute(code: currentBook.isbn13));
              },
            ),
          );
        }

        return SizedBox(
          height: spaceBetweenCards,
        );
      }),
    );
  }
}
