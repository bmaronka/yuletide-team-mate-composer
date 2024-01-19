import 'package:auto_route/auto_route.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.gr.dart';

@AutoRouterConfig()
class MainRouter extends $MainRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
