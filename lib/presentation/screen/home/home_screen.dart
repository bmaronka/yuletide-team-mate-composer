import 'dart:math' show pi;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/generate_team/generate_team_screen.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/home/widgets/animated_drawer.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/home/widgets/animated_drawer_icon.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/notifications/notifications_screen.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/profile/profile_screen.dart';
import 'package:yuletide_team_mate_composer/presentation/screen/settings/settings_screen.dart';
import 'package:yuletide_team_mate_composer/utils/hide_keyboard.dart';

final _animationDuration = .2.seconds;
final _drawerWidth = 260.w;

@RoutePage()
class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    final isOpened = useState(false);
    final activeRoute = useState(AppRoute.getRouteFromPath(context.router.currentPath));
    final drawerListener = useCallback(
      () => isOpened.value ? controller.forward() : controller.reverse(),
      [],
    );

    useEffect(
      () {
        isOpened.addListener(drawerListener);
        return () => isOpened.removeListener(drawerListener);
      },
      [],
    );

    final toggleDrawer = useCallback(
      () {
        hideKeyboard(context);
        isOpened.value = !isOpened.value;
      },
      [],
    );

    final changeRoute = useCallback(
      (AppRoute route) {
        activeRoute.value = route;
        context.router.navigate(route.route);
      },
      [],
    );

    final getScreenFromRoute = useCallback(
      () =>
          {
            AppRoute.generateTeam: const GenerateTeamScreen(),
            AppRoute.profile: const ProfileScreen(),
            AppRoute.notifications: const NotificationsScreen(),
            AppRoute.settings: const SettingsScreen(),
          }[activeRoute.value] ??
          const GenerateTeamScreen(),
      [],
    );

    return Animate(controller: controller, autoPlay: false).custom(
      duration: _animationDuration,
      builder: (_, value, __) => Scaffold(
        backgroundColor: Color.lerp(context.getColors().background, context.getColors().olive, value),
        body: Stack(
          children: [
            DisplayedChildWrapper(
              controller: controller,
              onTap: toggleDrawer,
              isOpened: isOpened.value,
              child: getScreenFromRoute(),
            ),
            AnimatedDrawer(
              width: _drawerWidth,
              animationValue: value,
              onItemTap: changeRoute,
              activeRoute: activeRoute.value,
            ),
            AnimatedDrawerIcon(
              animationValue: value,
              onTap: toggleDrawer,
              isOpened: isOpened.value,
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayedChildWrapper extends StatelessWidget {
  const DisplayedChildWrapper({
    required this.controller,
    required this.onTap,
    required this.isOpened,
    required this.child,
    super.key,
  });

  final AnimationController controller;
  final VoidCallback onTap;
  final bool isOpened;
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: isOpened ? onTap : null,
        child: IgnorePointer(
          ignoring: isOpened,
          child: child,
        ),
      )
          .animate(controller: controller, autoPlay: false)
          .custom(
            duration: _animationDuration,
            builder: (_, value, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(value * _drawerWidth, 0)
                ..rotateY(value - value * pi / 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(value * 30.r),
                child: child,
              ),
            ),
          )
          .scaleY(begin: 1, end: 0.85);
}
