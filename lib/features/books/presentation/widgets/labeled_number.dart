import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

class LabeledNumber extends StatelessWidget {
  const LabeledNumber({
    super.key,
    required this.label,
    required this.value,
    this.showStart = false,
  });

  final String label;
  final String value;
  final bool showStart;

  @override
  Widget build(BuildContext context) {
    const double fontSizeTitle = 18;
    const double fontSizeValue = 20;

    const double spaceBetween = 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: spaceBetween),
          child: AutoSizeText(label,
              style: TextStyle(
                fontSize: fontSizeTitle,
                color: AppColors.smokyBlueGray,
                fontVariations: FontVariations.semiBold,
                overflow: TextOverflow.ellipsis,
              )),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showStart)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: FaIcon(
                  FontAwesomeIcons.solidStar,
                  size: 18,
                  color: AppColors.sunset,
                ),
              ),
            AutoSizeText(value,
                style: TextStyle(
                  fontSize: fontSizeValue,
                  color: AppColors.veryLightBlue,
                  fontVariations: FontVariations.semiBold,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ],
    );
  }
}
