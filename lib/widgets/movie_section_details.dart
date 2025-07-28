import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/genre_chip.dart';

class MovieSectionDetails extends StatelessWidget {
  final Movie data;
  const MovieSectionDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.small,
        children: [
          Text(
            data.title,
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
                data.releaseDate.toString(),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                "•",
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                0.toString(),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
            ],
          ),

          Wrap(
            spacing: Spacing.small,
            children: data.genreIds
                .map((id) => GenreChip(label: Genre.getGenreById(id).label))
                .toList(),
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
                    "${data.voteAverage}/10",
                    style: GoogleFonts.montserrat(fontSize: FontSize.normal),
                  ),
                  Text(
                    "(${data.voteCount})",
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
