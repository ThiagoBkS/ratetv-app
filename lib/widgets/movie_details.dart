import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/services/tmdb_service.dart';
import 'package:project_a/widgets/genre_chip.dart';
import 'package:project_a/widgets/movie_details_poster.dart';

class MovieDetails extends StatelessWidget {
  final BasicMovie details;
  const MovieDetails({super.key, required this.details});

  Widget genreIdToWidget(int genreId) {
    // String? genre =
    //     availableGenres.firstWhere((genre) => genre.id == genreId).toString() ??
    //     "";

    return GenreChip(label: "TESTE");
  }

  @override
  Widget build(BuildContext context) {
    // final decimalPattern = NumberFormat.decimalPattern("pt_BR");

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
                    "https://image.tmdb.org/t/p/w500/${details.posterUrl}",
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
                        TmdbService.formattedDate(
                          details.releaseDate.toString(),
                        ),
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
                    children: List.generate(details.genreIds!.length, (index) {
                      return genreIdToWidget(details.genreIds![index]);
                    }),
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
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "(${details.voteCount})",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                            ),
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
