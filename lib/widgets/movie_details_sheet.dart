import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/widgets/details_sheet_action_button.dart';
import 'package:project_a/widgets/movie_details.dart';

void showMovieDetailsSheet(BuildContext context, BasicMovie details) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(24, 28, 31, 1),
    builder: (context) => MovieDetailsSheet(details: details),
  );
}

class MovieDetailsSheet extends StatelessWidget {
  final BasicMovie details;
  MovieDetailsSheet({super.key, required this.details});

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
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
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
                      MovieDetails(details: details),
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
