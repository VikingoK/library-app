import 'package:flutter/material.dart';

import 'package:librery_app/core/constants/asset_paths.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholderPath;
  final BoxFit fit;

  const AppNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholderPath = AssetPaths.placeholderBookSmall,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Image.asset(placeholderPath, fit: fit);
    }

    return FadeInImage(
      fit: fit,
      image: NetworkImage(imageUrl!),
      placeholder: AssetImage(placeholderPath),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(placeholderPath, fit: fit);
      },
    );
  }
}
