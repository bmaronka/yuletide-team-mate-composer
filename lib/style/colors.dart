import 'package:flutter/material.dart';

class YTMCColorTheme {
  const YTMCColorTheme({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.background,
  });

  final Color primary;
  final Color secondary;
  final Color white;
  final Color background;

  static YTMCColorTheme get lightTheme => const YTMCColorTheme(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        white: AppColors.white,
        background: AppColors.background,
      );

  static YTMCColorTheme get darkTheme => const YTMCColorTheme(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        white: AppColors.white,
        background: AppColors.background,
      );
}

class AppColors {
  static const Color primary = Color(0xFFFFA61E);
  static const Color secondary = Color(0xFF006939);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFF020041);
}
