import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/widgets/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_buttons_bar.dart';
import 'package:project_a/widgets/movie_genre_chip.dart';
import 'package:project_a/widgets/movie_poster.dart';
import 'package:project_a/widgets/movie_rating_model.dart';

class MovieContent extends StatelessWidget {
  final Movie movie;
  const MovieContent({super.key, required this.movie});

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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 48),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Expanded(
                    flex: 1,
                    child: MoviePoster(image: movie.posterPath),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text(
                            movie.title,
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.montserrat(fontSize: 13),
                              ),
                              Text(
                                "•",
                                style: GoogleFonts.montserrat(fontSize: 13),
                              ),
                              Text(
                                movie.runtime,
                                style: GoogleFonts.montserrat(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (Genre genre in movie.genres)
                                MovieGenreChip(label: genre.label),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidStar,
                                size: 14,
                                color: Color.fromRGBO(222, 181, 34, 1),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 4,
                                children: [
                                  Text(
                                    "8.1/10",
                                    style: GoogleFonts.montserrat(fontSize: 14),
                                  ),
                                  Text(
                                    "(10.134)",
                                    style: GoogleFonts.montserrat(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "“${movie.tagline}”",
                style: GoogleFonts.montserrat(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
              ),
              Text(
                movie.overview,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 8),
              MovieActionButtons(
                buttons: [
                  MovieActionButton(
                    icon: FontAwesomeIcons.check,
                    label: "Já Assisti",
                  ),
                  MovieActionButton(
                    icon: FontAwesomeIcons.bookmark,
                    label: "Adicionar",
                  ),
                  MovieActionButton(
                    icon: FontAwesomeIcons.star,
                    label: "Avaliar",
                    onTap: () {
                      openRatingModal(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
