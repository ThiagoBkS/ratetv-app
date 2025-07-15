import 'package:flutter/material.dart';
import 'package:project_a/widgets/movie_action_buttons.dart';

class MovieActionButtons extends StatelessWidget {
  final List<MovieActionButton> buttons;

  const MovieActionButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
