import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/old/widgets/movie_details_sheet/movie_details_poster.dart';

class MovieDetails extends StatelessWidget {
  final BasicMovie details;
  const MovieDetails({super.key, required this.details});

  // Widget genreIdToWidget(int genreId) {
  //   String label = Genre(id: genreId).name;
  //   return GenreChip(label: label);
  // }

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
              child: MovieDetailsPoster(posterImage: details.posterUrl!),
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
                      // Text(
                      //   TmdbService.formattedDate(
                      //     details.releaseDate.toString(),
                      //   ),
                      //   style: GoogleFonts.montserrat(fontSize: 12),
                      // ),
                    ],
                  ),
                  // Wrap(
                  //   spacing: 4,
                  //   runSpacing: 4,
                  //   children: List.generate(details.genreIds!.length, (index) {
                  //     return genreIdToWidget(details.genreIds![index]);
                  //   }),
                  // ),
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
                            "${details.voteAverage.toStringAsFixed(1)}/10",
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
