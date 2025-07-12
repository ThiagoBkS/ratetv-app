import 'package:flutter/material.dart';
import 'package:project_a/widgets/divider_bar.dart';
import 'package:project_a/widgets/stat_item.dart';

class ProfileStatContainer extends StatelessWidget {
  const ProfileStatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 46, 54, 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: Color.fromRGBO(46, 46, 54, 0.2), width: 1),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: StatItem(label: "Liked", value: 123)),
            DividerBar(),
            Expanded(child: StatItem(label: "Watched", value: 321)),
            DividerBar(),
            Expanded(child: StatItem(label: "Watch Later", value: 123)),
          ],
        ),
      ),
    );
  }
}
