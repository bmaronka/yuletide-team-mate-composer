import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';

class AnimatedDrawerIcon extends StatelessWidget {
  const AnimatedDrawerIcon({
    required this.controller,
    required this.animationDuration,
    required this.onTap,
    required this.isOpened,
    super.key,
  });

  final AnimationController controller;
  final Duration animationDuration;
  final VoidCallback onTap;
  final bool isOpened;

  @override
  Widget build(BuildContext context) => Positioned(
        top: 40,
        left: 20,
        child: Animate(controller: controller, autoPlay: false).custom(
          duration: animationDuration,
          curve: Curves.easeIn,
          builder: (_, value, __) => GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.lerp(context.getColors().background, context.getColors().white, value),
              ),
              child: Icon(
                isOpened ? Icons.close : Icons.menu,
                color: Color.lerp(context.getColors().white, context.getColors().background, value),
              ),
            ),
          ),
        ),
      );
}
