import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';
import 'package:yuletide_team_mate_composer/constants/animations.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  SplashScreen({super.key});

  final RiveAnimationController _controller = SimpleAnimation('Animation_Loop');

  @override
  Widget build(BuildContext context) {
    late SMITrigger riveInput;

    useEffect(
      () {
        _controller.isActive = true;
        return _controller.dispose;
      },
      [],
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () => riveInput.change(true),
        child: RiveAnimation.asset(
          merryChristmasAnimation.src,
          artboard: merryChristmasAnimation.artboard,
          fit: BoxFit.fill,
          controllers: [_controller],
          onInit: (artboard) {
            StateMachineController? controller = StateMachineController.fromArtboard(
              artboard,
              merryChristmasAnimation.stateMachineName,
            );
            artboard.addController(controller!);

            riveInput = controller.findInput<bool>('Character_Middle_l')! as SMITrigger;
          },
        ),
      ),
    );
  }
}
