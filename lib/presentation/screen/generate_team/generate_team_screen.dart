import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yuletide_team_mate_composer/extensions/build_context_extension.dart';
import 'package:yuletide_team_mate_composer/generated/l10n.dart';
import 'package:yuletide_team_mate_composer/style/typography.dart';

@RoutePage()
class GenerateTeamScreen extends StatelessWidget {
  const GenerateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.getColors().background,
        body: ListView(
          padding: EdgeInsets.only(
            top: 48.h,
            bottom: 16.h,
          ),
          children: [
            Text(
              Strings.of(context).generateTeam,
              style: StandardTypography.header2,
              textAlign: TextAlign.center,
            ),
            Gap(16.h),
            //TODO continue with animating input
            Container(
              height: 80.h,
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.h,
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        )
                        .boxShadow(
                          duration: 1.seconds,
                          begin: BoxShadow(
                            color: context.getColors().red,
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                          end: BoxShadow(
                            color: context.getColors().red,
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: TextField(
                      // TODO onSubmitted: () {}
                      textCapitalization: TextCapitalization.words,
                      style: StandardTypography.body1.copyWith(color: context.getColors().white),
                      decoration: InputDecoration(
                        hintText: Strings.of(context).namePlaceholder,
                        hintStyle: StandardTypography.body1.copyWith(color: context.getColors().white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: context.getColors().transparent,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
