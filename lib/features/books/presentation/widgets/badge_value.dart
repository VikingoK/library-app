import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

class BadgeValue extends StatelessWidget {
  const BadgeValue({
    super.key,
    required this.value,
    this.fontSize = 16,
  });

  final String value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.sunset, borderRadius: BorderRadius.circular(10)),
      child: AutoSizeText(
        value,
        style: TextStyle(
            fontSize: fontSize,
            color: AppColors.lightNeutralGrayColor,
            fontVariations: FontVariations.bold),
      ),
    );
  }
}
