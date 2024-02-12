import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';

enum AppRoute {
  splash('/', 'Splash'),
  home('/home', 'Home'),
  generateTeam('/generate-team', 'Generate team', Icons.diversity_3),
  profile('/profile', 'Profile', Icons.person),
  notifications('/notifications', 'Notifications', Icons.notifications),
  settings('/settings', 'Settings', Icons.settings);

  const AppRoute(
    this.path,
    this.name, [
    this.icon,
  ]);

  final String path;
  final String name;
  final IconData? icon;

  static List<AppRoute> drawerRoutes = [
    AppRoute.generateTeam,
    AppRoute.profile,
    AppRoute.notifications,
    AppRoute.settings,
  ];
}

@AutoRouterConfig()
class MainRouter extends $MainRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          // path: AppRoute.splash.path,
          // initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          // path: AppRoute.home.path,
          initial: true,
        ),
      ];
}
