import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/presentation/widgets/placeholder_widget.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: PlaceholderWidget(
          route: AppRoute.settings,
        ),
      );
}
