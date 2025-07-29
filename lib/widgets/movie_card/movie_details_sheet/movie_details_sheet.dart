import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/widgets/movie_card/movie_details_sheet/details_sheet_action_button.dart';
import 'package:project_a/widgets/movie_card_details.dart';

void showMovieDetailsSheet(BuildContext context, BasicMovie basicMovie) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(24, 28, 31, 1),
    builder: (context) => MovieDetailsSheet(basicMovie: basicMovie),
  );
}

class MovieDetailsSheet extends StatelessWidget {
  final BasicMovie basicMovie;
  MovieDetailsSheet({super.key, required this.basicMovie});

  final List<SheetActionButton> actionButtons = [
    SheetActionButton(
      label: "Avaliar",
      icon: LucideIcons.star300,
      onTap: () {},
    ),
    SheetActionButton(
      label: "Já Assiti",
      icon: LucideIcons.circle300,
      onTap: () {},
    ),
    SheetActionButton(
      label: "Assistir depois",
      icon: LucideIcons.bookmark300,
      onTap: () {},
    ),
    SheetActionButton(
      label: "Adicionar à lista",
      icon: LucideIcons.library300,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: double.infinity,
              child: ListView(
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      MovieCardDetails(basicMovie: basicMovie),
                      Column(children: List.from(actionButtons)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
