import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yuletide_team_mate_composer/extensions/list_extension.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';

const _placeholderText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    required this.route,
    super.key,
  });

  final AppRoute route;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 60.h,
        ),
        child: ListView(
          children: [
            const Text(_placeholderText),
            ...List.generate(route.index, (_) => const Placeholder(fallbackHeight: 150)),
          ].insertBetweenElements(() => Gap(16.h)),
        ),
      );
}
