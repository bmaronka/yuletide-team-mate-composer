import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';

@RoutePage()
class GenerateTeamScreen extends StatelessWidget {
  const GenerateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.getColors().background,
        body: ListView(
          padding: EdgeInsets.only(
            top: 90.h,
            bottom: 20.h,
            left: 16.w,
            right: 16.w,
          ),
          children: const [
            TextField(),
          ],
        ),
      );
}
