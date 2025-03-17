import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/constants/asset_paths.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/routes/books_router.dart';

class SearchRedirectBar extends StatelessWidget {
  const SearchRedirectBar({
    super.key,
    required this.paddingView,
  });

  final double paddingView;

  @override
  Widget build(BuildContext context) {
    const double radius = 10;
    const double sizeIcon = 20;

    const double heightBar = 60;

    const double fontSize = 17;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingView,
      ),
      child: CustomSplashButton(
        onTap: () {
          context.router.push(SearchRoute());
        },
        backgroundColor: AppColors.darkNavigationBar,
        child: Container(
          width: double.infinity,
          height: heightBar,
          padding: EdgeInsets.only(left: paddingView, right: paddingView),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText('Search book here...',
                  style: TextStyle(
                    fontVariations: FontVariations.medium,
                    color: AppColors.smokyBlueGray,
                    fontSize: fontSize,
                  ),
                  maxLines: 1,
                  minFontSize: fontSize),
              SizedBox(
                  width: sizeIcon,
                  height: sizeIcon,
                  child:
                      Image.asset(AssetPaths.searchImage, fit: BoxFit.contain)),
            ],
          ),
        ),
      ),
    );
  }
}
