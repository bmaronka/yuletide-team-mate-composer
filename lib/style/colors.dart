import 'package:flutter/material.dart';

class YTMCColorTheme {
  const YTMCColorTheme({
    required this.yellow,
    required this.white,
    required this.background,
    required this.lightBlue,
  });

  final Color yellow;
  final Color white;
  final Color background;
  final Color lightBlue;

  static YTMCColorTheme get lightTheme => const YTMCColorTheme(
        yellow: AppColors.yellow,
        white: AppColors.white,
        background: AppColors.background,
        lightBlue: AppColors.lightBlue,
      );

  static YTMCColorTheme get darkTheme => const YTMCColorTheme(
        yellow: AppColors.yellow,
        white: AppColors.white,
        background: AppColors.background,
        lightBlue: AppColors.lightBlue,
      );
}

class AppColors {
  static const Color yellow = Color(0xFFE09200);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFFF7F1);
  static const Color lightBlue = Color(0xFF90a5cc);
}
