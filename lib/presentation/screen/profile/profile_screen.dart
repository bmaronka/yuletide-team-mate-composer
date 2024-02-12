import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/presentation/widgets/placeholder_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: PlaceholderWidget(
          route: AppRoute.profile,
        ),
      );
}
