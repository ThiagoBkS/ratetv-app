import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/widgets/genre_chip.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';
import 'package:intl/intl.dart';
import 'package:project_a/widgets/movie_rating_info.dart';

class MovieCardDetails extends StatelessWidget {
  final BasicMovie basicMovie;
  const MovieCardDetails({super.key, required this.basicMovie});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: MovieCard(basicMovie: basicMovie),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    basicMovie.title,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        DateFormat(
                          "dd MMM. yyyy",
                          "pt_BR",
                        ).format(basicMovie.releaseDate).toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: List.generate(basicMovie.genreIds.length, (
                      index,
                    ) {
                      int id = basicMovie.genreIds[index];
                      return GenreChip(label: Genre.getGenreById(id).label);
                    }),
                  ),
                  MovieRatingInfo(
                    voteAverage: basicMovie.voteAverage,
                    voteCount: basicMovie.voteCount,
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          basicMovie.overview,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
