import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/models/tmdb_movie.dart';
import 'package:project_a/models/tmdb_search_result.dart';
import 'package:project_a/widgets/movie_details_sheet/movie_details.dart';
import 'package:project_a/widgets/movie_details_sheet/movie_details_button.dart';

void showMovieDetailsSheet(BuildContext context, TMDBSearchResult movie) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(24, 28, 31, 1),
    builder: (context) => MovieDetailsSheet(movie: movie),
  );
}

class MovieDetailsSheet extends StatelessWidget {
  final TMDBSearchResult movie;

  MovieDetailsSheet({super.key, required this.movie});

  final List<MovieDetailsButton> actionButtons = [
    MovieDetailsButton(
      label: "Avaliar",
      icon: LucideIcons.star300,
      onTap: () {},
    ),
    MovieDetailsButton(
      label: "Já Assiti",
      icon: LucideIcons.circle300,
      onTap: () {},
    ),
    MovieDetailsButton(
      label: "Assistir depois",
      icon: LucideIcons.bookmark300,
      onTap: () {},
    ),
    MovieDetailsButton(
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
                      Stack(
                        children: [
                          MovieDetails(details: movie),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                LucideIcons.arrowUpRight,
                                color: Colors.grey,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
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
