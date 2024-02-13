import 'package:flutter/material.dart';

class YTMCColorTheme {
  const YTMCColorTheme({
    required this.white,
    required this.transparent,
    required this.background,
    required this.yellow,
    required this.olive,
    required this.lightOlive,
  });

  final Color white;
  final Color transparent;
  final Color background;
  final Color yellow;
  final Color olive;
  final Color lightOlive;

  static YTMCColorTheme get lightTheme => const YTMCColorTheme(
        white: AppColors.white,
        transparent: AppColors.transparent,
        background: AppColors.background,
        yellow: AppColors.yellow,
        olive: AppColors.olive,
        lightOlive: AppColors.lightOlive,
      );

  static YTMCColorTheme get darkTheme => const YTMCColorTheme(
        white: AppColors.white,
        transparent: AppColors.transparent,
        background: AppColors.background,
        yellow: AppColors.yellow,
        olive: AppColors.olive,
        lightOlive: AppColors.lightOlive,
      );
}

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
  static const Color background = Color(0xFFFFF7F1);
  static const Color yellow = Color(0xFFE09200);
  static const Color olive = Color(0xFF9CB380);
  static const Color lightOlive = Color(0xFFAFC299);
}
