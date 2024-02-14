import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';

enum AppRoute {
  splash,
  home,
  generateTeam,
  profile,
  notifications,
  settings;

  PageRouteInfo<void> get route => switch (this) {
        AppRoute.splash => const SplashRoute(),
        AppRoute.home => const HomeRoute(),
        AppRoute.generateTeam => const GenerateTeamRoute(),
        AppRoute.profile => const ProfileRoute(),
        AppRoute.notifications => const NotificationsRoute(),
        AppRoute.settings => const SettingsRoute(),
      };

  String get name => switch (this) {
        AppRoute.generateTeam => Strings.current.generateTeam,
        AppRoute.profile => Strings.current.profile,
        AppRoute.notifications => Strings.current.notifications,
        AppRoute.settings => Strings.current.settings,
        _ => '',
      };

  String get path => switch (this) {
        AppRoute.generateTeam => '/home',
        AppRoute.profile => '/home/profile',
        AppRoute.notifications => '/home/notifications',
        AppRoute.settings => '/home/settings',
        _ => '',
      };

  IconData? get icon => switch (this) {
        AppRoute.generateTeam => Icons.diversity_3,
        AppRoute.profile => Icons.person,
        AppRoute.notifications => Icons.notifications,
        AppRoute.settings => Icons.settings,
        _ => null,
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
