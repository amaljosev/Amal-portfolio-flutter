import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/constants.dart';
import 'package:myportfolio/core/styles/appstyles.dart';
import 'package:myportfolio/screens/animations/circle_progress_animation.dart';
import 'package:myportfolio/screens/models/skills_model.dart';

class TabSkillsWidget extends StatelessWidget {
  const TabSkillsWidget({super.key, required this.skill, required this.size, required this.containerWidth, required this.fontSize});
  final Size size;
  final double containerWidth;
  final TabSkillsModel skill;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * containerWidth,
      child: Column(
        children: [
          AnimatedProgressIndicator(progressValue: skill.progress),
          Appconstants.smallheight,
          Text(
            skill.title,
            style: Appstyles.content(
                context: context, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
