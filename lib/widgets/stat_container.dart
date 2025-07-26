import 'package:flutter/material.dart';
import 'package:project_a/widgets/stat_column.dart';

class StatContainer extends StatelessWidget {
  const StatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 64, 64, 0.25),
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: Color.fromRGBO(64, 64, 64, 0.1),
            width: 1,
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatColumn(label: "Watched", value: 128),
              // DividerBar(),
              StatColumn(label: "Liked", value: 233),
              // DividerBar(),
              StatColumn(label: "Watch Later", value: 27),
            ],
          ),
        ),
      ),
    );
  }
}
