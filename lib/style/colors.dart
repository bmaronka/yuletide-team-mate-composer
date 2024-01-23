import 'package:flutter/material.dart';

class YTMCColorTheme {
  const YTMCColorTheme({
    required this.primary,
  });

  final Color primary;

  static YTMCColorTheme get lightTheme => const YTMCColorTheme(
        primary: AppColors.primary,
      );

  static YTMCColorTheme get darkTheme => const YTMCColorTheme(
        primary: AppColors.primary,
      );
}

class AppColors {
  static const Color primary = Color(0xFFFFA61E);
}
