import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';

enum AppRoute {
  splash('Splash', '/'),
  home('Home', '/home'),
  generateTeam('Generate team', '/home', Icons.diversity_3),
  profile('Profile', '/home/profile', Icons.person),
  notifications('Notifications', '/home/notifications', Icons.notifications),
  settings('Settings', '/home/settings', Icons.settings);

  const AppRoute(
    this.name,
    this.path, [
    this.icon,
  ]);

  final String name;
  final String path;
  final IconData? icon;

  PageRouteInfo<void> get route => switch (this) {
        AppRoute.splash => const SplashRoute(),
        AppRoute.home => const HomeRoute(),
        AppRoute.generateTeam => const GenerateTeamRoute(),
        AppRoute.profile => const ProfileRoute(),
        AppRoute.notifications => const NotificationsRoute(),
        AppRoute.settings => const SettingsRoute(),
      };

  static AppRoute getRouteFromPath(String path) =>
      AppRoute.values.firstWhereOrNull((r) => r.path == path) ?? AppRoute.generateTeam;

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
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [
            CustomRoute(
              page: GenerateTeamRoute.page,
              path: '',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: ProfileRoute.page,
              path: 'profile',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: NotificationsRoute.page,
              path: 'notifications',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: SettingsRoute.page,
              path: 'settings',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
      ];
}
