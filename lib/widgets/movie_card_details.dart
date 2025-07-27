import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/movie_preview.dart';
import 'package:project_a/widgets/genre_chip.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';
import 'package:intl/intl.dart';

class MovieCardDetails extends StatelessWidget {
  final MoviePreview details;
  const MovieCardDetails({super.key, required this.details});

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
              child: MovieCard(details: details),
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
                        DateFormat(
                          "dd MMM. yyyy",
                          "pt_BR",
                        ).format(details.releaseDate).toString(),
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
                    children: List.generate(details.genreIds.length, (index) {
                      int id = details.genreIds[index];
                      return GenreChip(label: Genre.getGenreById(id).label);
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
                            "${NumberFormat("#,##0.0", "pt_BR").format(details.voteAverage)}/10",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "(${NumberFormat.decimalPattern('pt_BR').format(details.voteCount)})",
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
