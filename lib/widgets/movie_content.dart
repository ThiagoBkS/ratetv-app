import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';
import 'package:project_a/enums/spacing.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/widgets/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_buttons_bar.dart';
import 'package:project_a/widgets/movie_cast_section.dart';
import 'package:project_a/widgets/movie_genre_chip.dart';
import 'package:project_a/widgets/movie_poster.dart';
import 'package:project_a/widgets/movie_rating_model.dart';
import 'package:project_a/widgets/movie_similars_section.dart';
import 'package:project_a/widgets/movie_streaming_platforms.dart';
import 'package:readmore/readmore.dart';

class MovieContent extends StatefulWidget {
  final Movie movie;
  const MovieContent({super.key, required this.movie});

  @override
  State<StatefulWidget> createState() {
    return MovieContentState();
  }
}

class MovieContentState extends State<MovieContent> {
  late Movie movie;
  int selectedStarIndex = -1;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  void openRatingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MovieRatingModel(
          movieTitle: movie.title,
          movieImage: movie.posterPath,
          selectedStarIndex: selectedStarIndex,
          onRate: (index) {
            setState(() {
              selectedStarIndex = index;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(Spacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: Spacing.large),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Spacing.medium,
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
                        spacing: Spacing.extraSmall,
                        children: [
                          Text(
                            movie.title,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: FontSize.extraLarge,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            spacing: Spacing.extraSmall,
                            children: [
                              Text(
                                movie.formattedReleaseDate,
                                style: GoogleFonts.montserrat(
                                  fontSize: FontSize.normal,
                                ),
                              ),
                              Text(
                                "•",
                                style: GoogleFonts.montserrat(
                                  fontSize: FontSize.normal,
                                ),
                              ),
                              Text(
                                movie.formattedRuntime,
                                style: GoogleFonts.montserrat(
                                  fontSize: FontSize.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Spacing.extraSmall),
                          Wrap(
                            spacing: Spacing.small,
                            runSpacing: Spacing.small,
                            children: [
                              for (Genre genre in movie.genres)
                                MovieGenreChip(label: genre.label),
                            ],
                          ),
                          SizedBox(height: Spacing.extraSmall),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: Spacing.small,
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
                                    "8.5/10",
                                    style: GoogleFonts.montserrat(
                                      fontSize: FontSize.normal,
                                    ),
                                  ),
                                  Text(
                                    "(467k)",
                                    style: GoogleFonts.montserrat(
                                      fontSize: FontSize.extraSmall,
                                    ),
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
                  fontSize: FontSize.normal,
                ),
              ),
              ReadMoreText(
                movie.overview,
                trimLength: 192,
                style: GoogleFonts.montserrat(
                  fontSize: FontSize.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: Spacing.small),
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
                    icon: selectedStarIndex >= 0
                        ? FontAwesomeIcons.solidStar
                        : FontAwesomeIcons.star,

                    label: "Avaliar ${selectedStarIndex + 1}/5",
                    iconColor: selectedStarIndex >= 0
                        ? Colors.amber
                        : Colors.white,
                    onTap: () {
                      openRatingModal(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: Spacing.small),
              MovieStreamingPlatforms(platforms: movie.avaliablePlatforms),
              SizedBox(height: Spacing.small),
              MovieCastSection(),
              SizedBox(height: Spacing.small),
              MovieSimilarsSection(),
            ],
          ),
        ),
      ],
    );
  }
}
