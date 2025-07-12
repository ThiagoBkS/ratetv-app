import 'package:flutter/material.dart';
import 'package:project_a/models/profile_stat.dart';
import 'package:project_a/widgets/divider_bar.dart';
import 'package:project_a/widgets/profile_widgets/stat_column.dart';

class StatContainer extends StatelessWidget {
  final List<ProfileStat> stats;
  const StatContainer({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 46, 54, 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: Color.fromRGBO(46, 46, 54, 0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(21, 21, 29, 1),
            blurRadius: 36,
            spreadRadius: 8,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: StatColumn(label: stats[0].label, value: stats[0].value),
            ),
            DividerBar(),
            Expanded(
              child: StatColumn(label: stats[1].label, value: stats[1].value),
            ),
            DividerBar(),
            Expanded(
              child: StatColumn(label: stats[2].label, value: stats[2].value),
            ),
          ],
        ),
      ),
    );
  }
}
