// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:yuletide_team_mate_composer/presentation/screen/generate_team/generate_team_screen.dart'
    as _i1;
import 'package:yuletide_team_mate_composer/presentation/screen/home/home_screen.dart'
    as _i2;
import 'package:yuletide_team_mate_composer/presentation/screen/notifications/notifications_screen.dart'
    as _i3;
import 'package:yuletide_team_mate_composer/presentation/screen/profile/profile_screen.dart'
    as _i4;
import 'package:yuletide_team_mate_composer/presentation/screen/settings/settings_screen.dart'
    as _i5;
import 'package:yuletide_team_mate_composer/presentation/screen/splash/splash_screen.dart'
    as _i6;

abstract class $MainRouter extends _i7.RootStackRouter {
  $MainRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    GenerateTeamRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GenerateTeamScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NotificationsScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.GenerateTeamScreen]
class GenerateTeamRoute extends _i7.PageRouteInfo<void> {
  const GenerateTeamRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GenerateTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateTeamRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NotificationsScreen]
class NotificationsRoute extends _i7.PageRouteInfo<void> {
  const NotificationsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
