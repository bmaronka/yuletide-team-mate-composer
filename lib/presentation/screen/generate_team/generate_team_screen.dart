import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/presentation/widgets/placeholder_widget.dart';

class GenerateTeamScreen extends StatelessWidget {
  const GenerateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: PlaceholderWidget(
          route: AppRoute.generateTeam,
        ),
      );
}
