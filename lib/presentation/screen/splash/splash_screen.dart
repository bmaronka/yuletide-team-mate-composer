import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:yuletide_team_mate_composer/constants/animations.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/generated/assets/assets.gen.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late RiveAnimationController _christmasAnimationController;

  late SMITrigger _christmasTrigger;

  @override
  void initState() {
    _christmasAnimationController = SimpleAnimation(MerryChristmasAnimation.animation);
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _christmasAnimationController.isActive = true;
    Future.delayed(const Duration(seconds: 6), _textAnimationController.forward);

    super.initState();
  }

  @override
  void dispose() {
    _christmasAnimationController.dispose();
    _textAnimationController.dispose();
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
    if (_textAnimationController.isCompleted) {
      _christmasTrigger.change(true);
      _textAnimationController.reset();
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
              //TODO add animated loading text
              IgnorePointer(
                child: Assets.animations.merryChristmas.rive(
                  artboard: MerryChristmasAnimation.artboard,
                  fit: BoxFit.fill,
                  controllers: [_christmasAnimationController],
                  onInit: _init,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: FadeTransition(
                  opacity: _textAnimationController,
                  child: Text(
                    Strings.of(context).tapToContinue,
                    style: TextStyle(
                      fontSize: 40,
                      color: context.getColors().primary,
                      fontFamily: 'Lato',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
