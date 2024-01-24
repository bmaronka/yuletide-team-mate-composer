import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:yuletide_team_mate_composer/constants/rive_animations.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/generated/assets/assets.gen.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';
import 'package:yuletide_team_mate_composer/style/typography.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _tapToContinueAnimationController;
  late AnimationController _loadingAnimationController;
  late RiveAnimationController _christmasAnimationController;

  late SMITrigger _christmasTrigger;

  @override
  void initState() {
    _christmasAnimationController = SimpleAnimation(MerryChristmasAnimation.animation);
    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _tapToContinueAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _christmasAnimationController.isActive = true;
    _loadingAnimationController.forward();
    Future.delayed(const Duration(seconds: 6), () {
      _loadingAnimationController.reverse();
      _tapToContinueAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _christmasAnimationController.dispose();
    _loadingAnimationController.dispose();
    _tapToContinueAnimationController.dispose();
    super.dispose();
  }

  void _init(Artboard artboard) {
    StateMachineController? stateMachineController = StateMachineController.fromArtboard(
      artboard,
      MerryChristmasAnimation.stateMachine,
    );
    artboard.addController(stateMachineController!);

    _christmasTrigger = stateMachineController.findInput<bool>(MerryChristmasAnimation.input1)! as SMITrigger;
  }

  void _continueToNextPage() {
    if (_tapToContinueAnimationController.isCompleted) {
      _christmasTrigger.change(true);
      _tapToContinueAnimationController.reset();
      Future.delayed(
        const Duration(seconds: 5),
        () => context.router.push(const HomeRoute()),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onTap: _continueToNextPage,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                child: Assets.animations.merryChristmas.rive(
                  artboard: MerryChristmasAnimation.artboard,
                  fit: BoxFit.fill,
                  controllers: [_christmasAnimationController],
                  onInit: _init,
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: _loadingAnimationController,
                  child: Text(
                    Strings.of(context).loading,
                    style: StandardTypography.header1.copyWith(color: context.getColors().primary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 20,
                right: 20,
                child: FadeTransition(
                  opacity: _tapToContinueAnimationController,
                  child: Text(
                    Strings.of(context).tapToContinue,
                    style: StandardTypography.header1.copyWith(color: context.getColors().primary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
