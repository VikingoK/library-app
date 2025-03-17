import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/constants/asset_paths.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

class TextWithLogo extends StatelessWidget {
  const TextWithLogo({
    super.key,
    required this.paddingTop,
    required this.paddingView,
  });

  final double paddingTop;
  final double paddingView;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 28;

    const double imageSize = 70;

    return Container(
      padding: EdgeInsets.only(
        bottom: paddingTop,
        left: paddingView,
        right: paddingView,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Discover',
                style: TextStyle(
                    fontSize: fontSize,
                    color: AppColors.softWhite,
                    fontVariations: FontVariations.semiBold),
                maxLines: 1,
              ),
              AutoSizeText(
                'Books',
                style: TextStyle(
                    fontSize: fontSize,
                    color: AppColors.softWhite,
                    fontVariations: FontVariations.bold),
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(AssetPaths.logoImage, fit: BoxFit.contain))
        ],
      ),
    );
  }
}
