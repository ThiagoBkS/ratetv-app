import 'package:flutter/material.dart';
import 'package:project_a/utils/palette.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_action/movie_action_button.dart';

class MovieActionButtons extends StatelessWidget {
  final List<MovieActionButton> buttons;

  const MovieActionButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.normal),
        color: Palette.primaryColor,
        border: BoxBorder.all(color: Palette.primaryColor),
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
