import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.description,
    required this.paddingView,
  });

  final String description;
  final double paddingView;

  @override
  Widget build(BuildContext context) {
    const double spaceBottom = 70;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: paddingView, right: paddingView, bottom: spaceBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText('Descripción',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.lightNeutralGrayColor,
                fontVariations: FontVariations.bold,
                overflow: TextOverflow.ellipsis,
              )),
          AutoSizeText(description,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.smokyBlueGray,
                fontVariations: FontVariations.medium,
              )),
        ],
      ),
    );
  }
}
