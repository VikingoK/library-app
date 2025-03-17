import 'package:flutter/material.dart';
import 'package:librery_app/core/theme/app_colors.dart';

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
        colorSchemeSeed: AppColors.darkBackground,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
      );
}
