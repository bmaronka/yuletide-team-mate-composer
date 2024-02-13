import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/style/typography.dart';

class AnimatedDrawer extends StatelessWidget {
  const AnimatedDrawer({
    required this.controller,
    required this.width,
    required this.animationDuration,
    required this.onItemTap,
    required this.activeRoute,
    super.key,
  });

  final AnimationController controller;
  final double width;
  final Duration animationDuration;
  final Function(AppRoute) onItemTap;
  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 60.h),
        width: width,
        height: MediaQuery.sizeOf(context).height,
        child: ListView.separated(
          itemCount: AppRoute.drawerRoutes.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => Gap(8.h),
          itemBuilder: (context, index) {
            final route = AppRoute.drawerRoutes[index];
            return DrawerItem(
              route: route,
              onTap: () => onItemTap(route),
              selected: activeRoute == route,
              width: width,
            );
          },
        ),
      ).animate(controller: controller, autoPlay: false).moveX(begin: -width, end: 0, duration: animationDuration);
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.route,
    required this.onTap,
    required this.selected,
    required this.width,
    super.key,
  });

  final AppRoute route;
  final VoidCallback onTap;
  final bool selected;
  final double width;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedPositioned(
            duration: .3.seconds,
            left: selected ? 0 : -width,
            child: Material(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
              color: context.getColors().lightOlive,
              child: SizedBox(
                width: width - 16.w,
                height: 56,
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            splashColor: context.getColors().transparent,
            child: ListTile(
              leading: Icon(
                route.icon,
                color: context.getColors().white,
              ),
              minLeadingWidth: 16.w,
              title: Text(
                route.name,
                style: StandardTypography.header2.copyWith(color: context.getColors().white),
              ),
            ),
          ),
        ],
      );
}
