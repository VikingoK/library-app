import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

import 'package:librery_app/features/books/presentation/widgets/labeled_number.dart';

class BookMetadata extends StatelessWidget {
  const BookMetadata({
    super.key,
    required this.rating,
    required this.numberOfPages,
    required this.year,
    required this.paddingView,
    required this.websiteUrl,
  });
  final String rating;
  final String numberOfPages;
  final String year;
  final double paddingView;
  final String? websiteUrl;

  @override
  Widget build(BuildContext context) {
    const double spaceMarginTop = 20;
    const double spaceMarginBottom = 25;

    return Container(
      margin: EdgeInsets.only(bottom: spaceMarginBottom),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: paddingView, vertical: paddingView),
            margin:
                EdgeInsets.only(top: spaceMarginTop, bottom: spaceMarginBottom),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.deepSlateGray,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LabeledNumber(
                  label: 'Rating',
                  value: rating,
                  showStart: true,
                ),
                LabeledNumber(label: 'Num Pages', value: numberOfPages),
                LabeledNumber(label: 'Year', value: year),
              ],
            ),
          ),
          if (websiteUrl != null)
            CustomSplashButton(
              onTap: () async {
                try {
                  final url = Uri.parse(websiteUrl!);
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('The website could not be opened.')),
                    );
                  }
                }
              },
              backgroundColor: AppColors.sunset,
              splashColor: AppColors.sunsetSplash,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: paddingView, vertical: paddingView),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: AutoSizeText('Go to the website',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.darkBackground,
                            fontVariations: FontVariations.bold,
                          )),
                    ),
                    FaIcon(
                      FontAwesomeIcons.arrowUpRightFromSquare,
                      color: AppColors.darkBackground,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
