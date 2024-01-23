import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/style/colors.dart';

extension ThemeProvider on BuildContext {
  YTMCColorTheme getColors() => Theme.of(this).extension<YTMCColorTheme>() ?? YTMCColorTheme.lightTheme;
}
