import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:yuletide_team_mate_composer/constants/rive_animations.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/generated/assets/assets.gen.dart';
import 'package:yuletide_team_mate_composer/generated/assets/fonts.gen.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/style/typography.dart';

const _animationTime = 600;
const _animationDelayTime = 5000;
const _tapToContinueAnimationDelayTime = _animationDelayTime + 2 * _animationTime;

@RoutePage()
class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tapToContinueAnimationController = useAnimationController();
    final christmasAnimationController = useRef(SimpleAnimation(MerryChristmasAnimation.animation));
    ObjectRef<SMITrigger?> christmasTrigger = useRef<SMITrigger?>(null);

    useEffect(
      () {
        christmasAnimationController.value.isActive = true;
        return christmasAnimationController.value.dispose;
      },
      [],
    );

    final riveAnimationInit = useCallback(
      (Artboard artboard) {
        StateMachineController? stateMachineController = StateMachineController.fromArtboard(
          artboard,
          MerryChristmasAnimation.stateMachine,
        );
        artboard.addController(stateMachineController!);

        christmasTrigger.value = stateMachineController.findInput<bool>(MerryChristmasAnimation.input1)! as SMITrigger;
      },
      [],
    );
    final continueToNextPage = useCallback(
      () {
        if (tapToContinueAnimationController.isCompleted) {
          christmasTrigger.value?.change(true);
          tapToContinueAnimationController.reset();
          Future.delayed(
            const Duration(milliseconds: _animationDelayTime),
            () => context.router.push(AppRoute.home.route),
          );
        }
      },
      [],
    );

    return Scaffold(
      backgroundColor: context.getColors().background,
      body: GestureDetector(
        onTap: continueToNextPage,
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                child: SizedBox(
                  height: 325.h,
                  child: Assets.animations.merryChristmas.rive(
                    artboard: MerryChristmasAnimation.artboard,
                    fit: BoxFit.fill,
                    controllers: [christmasAnimationController.value],
                    onInit: riveAnimationInit,
                  ),
                ),
              ),
              Positioned(
                bottom: 110.h,
                left: 20.w,
                right: 20.w,
                child: Text(
                  Strings.of(context).tapToContinue,
                  style: StandardTypography.header1.copyWith(
                    color: context.getColors().yellow,
                    fontFamily: FontFamily.playfairDisplay,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate(
                      controller: tapToContinueAnimationController,
                      delay: const Duration(milliseconds: _tapToContinueAnimationDelayTime),
                    )
                    .fadeIn(duration: const Duration(milliseconds: _animationTime))
                    .scale(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
