import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:librery_app/core/constants/asset_paths.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/providers/recent_search/recent_search_provider.dart';
import 'package:librery_app/features/books/presentation/routes/books_router.dart';

class RecentSearchs extends ConsumerWidget {
  const RecentSearchs({
    super.key,
    required this.paddingView,
  });

  final double paddingView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentSearch = ref.watch(recentSearchProvider);

    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              left: paddingView,
              right: paddingView,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FaIcon(FontAwesomeIcons.clockRotateLeft, size: 17),
                ),
                AutoSizeText(
                  'Recent searches',
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColors.softWhite,
                      fontVariations: FontVariations.medium),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          (recentSearch.isEmpty)
              ? SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                      child: AutoSizeText(
                    'No recent searches',
                    style: TextStyle(
                        fontSize: 17,
                        color: AppColors.smokyBlueGray,
                        fontVariations: FontVariations.medium),
                  )),
                )
              : SizedBox(
                  height: 40,
                  child: ListView.separated(
                    itemCount: recentSearch.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final String currentSearch = recentSearch[index];

                      return CustomSplashButton(
                        onTap: () {
                          context.router
                              .push(SearchRoute(query: currentSearch));
                        },
                        backgroundColor: AppColors.naturalWhiteColor,
                        splashColor: AppColors.softSlateGray,
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: index == 0 ? paddingView : 20,
                              right: index == 4 ? paddingView : 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: AutoSizeText(
                                  currentSearch,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.nightGray,
                                      fontVariations: FontVariations.bold),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                  width: 13,
                                  height: 13,
                                  child: Image.asset(AssetPaths.recentSearch,
                                      fit: BoxFit.contain))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
