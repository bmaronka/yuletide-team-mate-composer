import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';

class AnimatedDrawerIcon extends StatelessWidget {
  const AnimatedDrawerIcon({
    required this.animationValue,
    required this.onTap,
    required this.isOpened,
    super.key,
  });

  final double animationValue;
  final VoidCallback onTap;
  final bool isOpened;

  @override
  Widget build(BuildContext context) => Positioned(
        top: 36.h,
        left: 4.w,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(12.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.lerp(context.getColors().olive, context.getColors().white, animationValue),
            ),
            child: Icon(
              isOpened ? Icons.close : Icons.menu,
              color: Color.lerp(context.getColors().white, context.getColors().olive, animationValue),
            ),
          ),
        ),
      );
}
