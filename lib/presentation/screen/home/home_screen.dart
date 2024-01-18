import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(Strings.of(context).test),
        ),
      );
}
