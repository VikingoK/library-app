import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/widgets/book_image.dart';

class BookResultCard extends StatelessWidget {
  const BookResultCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.onTap,
      this.imageUrl});

  final String title;
  final String? subtitle;
  final String price;
  final String? imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    const double paddingSpace = 15;
    const double topSpace = 30;
    const double leftSpace = 20;

    const double imageWidth = 70;
    const double heightCard = 130;

    const double fontSizeTitle = 18;
    const double fontSizeSubtitle = 16;
    const double fontSizePrice = 19;

    const EdgeInsetsGeometry padding = EdgeInsets.only(
        top: topSpace,
        bottom: paddingSpace,
        left: leftSpace,
        right: paddingSpace);

    return CustomSplashButton(
      onTap: onTap,
      backgroundColor: AppColors.deepSlateGray,
      child: Container(
        width: double.infinity,
        height: heightCard,
        padding: const EdgeInsets.symmetric(horizontal: paddingSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            BookImage(imageWidth: imageWidth, imageUrl: imageUrl),
            _BookInfo(
                padding: padding,
                title: title,
                fontSizeTitle: fontSizeTitle,
                subtitle: subtitle,
                fontSizeSubtitle: fontSizeSubtitle,
                price: price,
                fontSizePrice: fontSizePrice),
          ],
        ),
      ),
    );
  }
}

class _BookInfo extends StatelessWidget {
  const _BookInfo({
    required this.padding,
    required this.title,
    required this.fontSizeTitle,
    required this.subtitle,
    required this.fontSizeSubtitle,
    required this.price,
    required this.fontSizePrice,
  });

  final EdgeInsetsGeometry padding;
  final String title;
  final double fontSizeTitle;
  final String? subtitle;
  final double fontSizeSubtitle;
  final String price;
  final double fontSizePrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    color: AppColors.softWhite,
                    fontVariations: FontVariations.semiBold,
                    overflow: TextOverflow.ellipsis,
                  )),
              if (subtitle != null)
                AutoSizeText(subtitle!,
                    style: TextStyle(
                      fontSize: fontSizeSubtitle,
                      color: AppColors.softSlateGray,
                      fontVariations: FontVariations.semiBold,
                      overflow: TextOverflow.ellipsis,
                    )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(price,
                          style: TextStyle(
                            fontSize: fontSizePrice,
                            fontVariations: FontVariations.semiBold,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
