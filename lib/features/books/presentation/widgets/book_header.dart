import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';
import 'package:librery_app/core/presentation/widgets/app_network_image.dart';
import 'package:librery_app/features/books/presentation/widgets/badge_value.dart';

class BookHeader extends StatelessWidget {
  const BookHeader(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      this.imageUrl});

  final String? imageUrl;
  final String title;
  final String? subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    const double imageWidth = 160;
    const double heightCard = 220;

    const double fontSizeTitle = 21;
    const double fontSizeSubtitle = 16;
    const double fontSizePrice = 15;

    const double spaceMargin = 20;

    const double spacePadding = 15;
    const double spaceBottom = 10;

    return Padding(
      padding: const EdgeInsets.only(
          right: spacePadding,
          left: spacePadding,
          bottom: spaceBottom,
          top: spacePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: imageWidth,
                height: heightCard,
                margin: const EdgeInsets.only(
                    bottom: 25,
                    top: spaceMargin,
                    right: spaceMargin,
                    left: spaceMargin),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightNeutralGrayColor),
                child: AppNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 10,
                child: BadgeValue(
                  value: price,
                  fontSize: fontSizePrice,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: spaceBottom),
            child: AutoSizeText(title,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  color: AppColors.softWhite,
                  fontVariations: FontVariations.semiBold,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          if (subtitle != null)
            AutoSizeText(subtitle!,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizeSubtitle,
                  color: AppColors.softSlateGray,
                  fontVariations: FontVariations.semiBold,
                  overflow: TextOverflow.ellipsis,
                )),
        ],
      ),
    );
  }
}
