import 'package:flutter/material.dart';

import 'package:librery_app/core/presentation/widgets/app_network_image.dart';
import 'package:librery_app/core/theme/app_colors.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.imageWidth,
    required this.imageUrl,
    this.imageHeight = 90,
  });

  final double imageWidth;
  final String? imageUrl;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightNeutralGrayColor),
      child: AppNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
