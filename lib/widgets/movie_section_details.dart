import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_genre.dart';
import 'package:project_a/models/tmdb_movie.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/genre_chip.dart';

class MovieSectionDetails extends StatelessWidget {
  final CompleteMovie data;
  MovieSectionDetails({super.key, required this.data});

  final List<TMDBGenre> genres = [
    TMDBGenre(id: 18, name: "Drama"),
    TMDBGenre(id: 53, name: "Thriller"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.small,
        children: [
          Text(
            data.movie.title,
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
                TMDBMovie.formattedDate(data.movie.releaseDate.toString()),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                "•",
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                TMDBMovie.formattedTime(139),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
            ],
          ),
          Wrap(
            spacing: Spacing.small,
            children: genres.map((genre) {
              return GenreChip(id: genre.id, label: genre.name);
            }).toList(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: Spacing.extraSmall,
            children: [
              Icon(
                FontAwesomeIcons.solidStar,
                size: 14,
                color: Color.fromRGBO(222, 181, 34, 1),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Spacing.extraSmall,
                children: [
                  Text(
                    "${data.movie.voteAverage}/10",
                    style: GoogleFonts.montserrat(fontSize: FontSize.normal),
                  ),
                  Text(
                    "(${data.movie.voteCount})",
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
    );
  }
}
