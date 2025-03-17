import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/routes/books_router.dart';
import 'package:librery_app/features/books/presentation/widgets/book_image.dart';

class ThumbnailInfo extends StatelessWidget {
  const ThumbnailInfo(
      {super.key,
      required this.imageUrl,
      required this.title,
      this.subtitle,
      required this.isLoading,
      required this.code});

  final String? imageUrl;
  final String title;
  final String? subtitle;
  final bool isLoading;
  final String code;

  @override
  Widget build(BuildContext context) {
    const double imageWidth = 120;
    const double imageHeight = 150;

    const double fontSizeTitle = 18;
    const double fontSizeSubtitle = 16;

    const double spacePadding = 8;

    return Padding(
      padding: const EdgeInsets.only(right: spacePadding, left: spacePadding),
      child: CustomSplashButton(
        onTap: () {
          context.router.push(DetailRoute(code: code));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BookImage(
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                imageUrl: imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, right: 9, left: 10),
              child: AutoSizeText(
                title,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  color: AppColors.softWhite,
                  fontVariations: FontVariations.semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(right: 9, left: 10),
                child: AutoSizeText(
                  subtitle!,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: fontSizeSubtitle,
                    color: AppColors.softSlateGray,
                    fontVariations: FontVariations.semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
