import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_a/old/models/genre.dart';
import 'package:project_a/old/models/tmdb_movie.dart';
import 'package:project_a/old/models/tmdb_search_result.dart';
import 'package:project_a/old/widgets/movie_details_sheet/genre_chip.dart';
import 'package:project_a/old/widgets/movie_details_sheet/movie_details_poster.dart';

class MovieDetails extends StatelessWidget {
  final TMDBSearchResult details;
  const MovieDetails({super.key, required this.details});

  Widget genreIdToWidget(int genreId) {
    String label = Genre(id: genreId).name;
    return GenreChip(label: label);
  }

  @override
  Widget build(BuildContext context) {
    final decimalPattern = NumberFormat.decimalPattern("pt_BR");

    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: MovieDetailsPoster(
                posterImage:
                    "https://image.tmdb.org/t/p/w500/" + details.posterPath,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    details.title,
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
                        TMDBMovie.formattedDate(details.releaseDate.toString()),
                        style: GoogleFonts.montserrat(fontSize: 12),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [Text(Genre.getNamesByIds(details.genreIds))],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Color.fromRGBO(222, 181, 34, 1),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            "${details.voteAverage}/10",
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            "(${decimalPattern.format(details.voteCount)})",
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          details.overview,
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
