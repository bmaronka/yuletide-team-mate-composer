import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuletide_team_mate_composer/generated/assets/fonts.gen.dart';

class StandardTypography {
  static const lato = FontFamily.lato;
  static const playfairDisplay = FontFamily.playfairDisplay;

  /// Header
  static final header1 = TextStyle(
    fontSize: 36.sp,
    height: 1.1,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static final header2 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.1,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
