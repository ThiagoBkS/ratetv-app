import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/utils/utils.dart';
import 'package:project_a/widgets/genre_chip.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';
import 'package:project_a/widgets/movie_card/movie_details_sheet/movie_details_sheet.dart';
import 'package:project_a/widgets/movie_rating_info.dart';

class MovieCollectionCard extends StatelessWidget {
  final BasicMovie basicMovie;
  const MovieCollectionCard({super.key, required this.basicMovie});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          goToMoviePage(context, basicMovie.id);
        },
        onLongPress: () {
          showMovieDetailsSheet(context, basicMovie);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Flexible(flex: 2, child: MovieCard(basicMovie: basicMovie)),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Text(
                              basicMovie.title,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Row(
                                  spacing: Spacing.extraSmall,
                                  children: [
                                    Text(
                                      formatDate(basicMovie.releaseDate),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "•",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      Movie.formatRuntime(100),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                MovieRatingInfo(
                                  voteAverage: basicMovie.voteAverage,
                                  voteCount: basicMovie.voteCount,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: List.generate(
                                    basicMovie.genres.length,
                                    (index) {
                                      String label = basicMovie.genres[index];
                                      return GenreChip(label: label);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                basicMovie.overview,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
