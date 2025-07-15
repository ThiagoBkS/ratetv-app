import 'package:flutter/material.dart';
import 'package:project_a/widgets/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_buttons_bar.dart';
import 'package:project_a/widgets/movie_rating_model.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  void openRatingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MovieRatingModel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MovieActionButtons(
              buttons: [
                MovieActionButton(
                  icon: Icons.abc,
                  label: "A",
                  onTap: () {
                    openRatingModal(context);
                  },
                ),
                MovieActionButton(icon: Icons.abc, label: "B"),
                MovieActionButton(icon: Icons.abc, label: "C"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
