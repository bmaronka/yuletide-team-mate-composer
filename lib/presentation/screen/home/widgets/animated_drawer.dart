import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';

class AnimatedDrawer extends StatelessWidget {
  const AnimatedDrawer({
    required this.controller,
    required this.width,
    required this.animationDuration,
    super.key,
  });

  final AnimationController controller;
  final double width;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) => Container(
        color: context.getColors().background,
        width: width,
        height: MediaQuery.sizeOf(context).height,
      ).animate(controller: controller, autoPlay: false).moveX(begin: -width, end: 0, duration: animationDuration);
}
