import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/injectable/injectable.dart';
import 'package:yuletide_team_mate_composer/style/typography.dart';
import 'package:yuletide_team_mate_composer/utils/hide_keyboard.dart';

const _tabletSize = Size(750, 1334);
const _mobileSize = Size(375, 667);

class MyApp extends StatelessWidget {
  final RootStackRouter _router;

  const MyApp(this._router, {super.key});

  @override
  Widget build(BuildContext context) => HookedBlocConfigProvider(
        injector: () => getIt.get,
        builderCondition: (state) => state != null,
        listenerCondition: (state) => state != null,
        child: _globalUnfocusKeyboard(
          context: context,
          child: ScreenUtilInit(
            designSize: kIsWeb
                ? ScreenUtil.defaultSize
                : Device.get().isTablet
                    ? _tabletSize
                    : _mobileSize,
            builder: (_, __) => MaterialApp.router(
              builder: (_, child) => child ?? const SizedBox.shrink(),
              routeInformationParser: _router.defaultRouteParser(),
              routerDelegate: _router.delegate(
                navigatorObservers: () => [
                  ...AutoRouterDelegate.defaultNavigatorObserversBuilder(),
                ],
              ),
              theme: FlexThemeData.light(
                scheme: FlexScheme.aquaBlue,
                fontFamily: StandardTypography.lato,
              ),
              darkTheme: FlexThemeData.dark(
                scheme: FlexScheme.aquaBlue,
                fontFamily: StandardTypography.lato,
              ),
              themeMode: ThemeMode.system,
              localizationsDelegates: const [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Strings.delegate.supportedLocales,
            ),
          ),
        ),
      );

  Widget _globalUnfocusKeyboard({
    required BuildContext context,
    required Widget child,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => hideKeyboard(context),
        child: child,
      );
}
