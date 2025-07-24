import 'package:flutter/material.dart';
import 'package:project_a/old/utils/spacing.dart';
import 'package:project_a/old/widgets/movie_action_button.dart';

class MovieActionButtons extends StatelessWidget {
  final List<MovieActionButton> buttons;

  const MovieActionButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.normal),
        color: Color.fromRGBO(56, 63, 68, 0.2),
        border: BoxBorder.all(color: Color.fromRGBO(56, 63, 68, 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (MovieActionButton button in buttons) Expanded(child: button),
        ],
      ),
    );
  }
}
