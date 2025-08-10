import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';
import 'package:project_a/widgets/movie_section_details.dart';

class MovieHeader extends StatelessWidget {
  final Movie data;
  const MovieHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.small,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Spacing.normal,
          children: [
            Flexible(
              flex: 2,
              child: MovieCard(
                basicMovie: BasicMovie(
                  isAdult: data.isAdult,
                  backdropUrl: data.backdropUrl,
                  genres: data.genres,
                  id: data.id,
                  overview: data.overview,
                  posterUrl: data.posterUrl,
                  releaseDate: data.releaseDate,
                  title: data.title,
                  voteAverage: data.voteAverage,
                  voteCount: data.voteCount,
                ),
              ),
            ),
            Expanded(flex: 5, child: MovieSectionDetails(data: data)),
          ],
        ),
        SizedBox(height: Spacing.extraSmall),
        if (data.tagline.isNotEmpty)
          Text(
            "“${data.tagline}”",
            style: GoogleFonts.montserrat(
              fontStyle: FontStyle.italic,
              fontSize: FontSize.normal,
            ),
          ),
        Text(
          data.overview,
          style: GoogleFonts.montserrat(
            fontSize: FontSize.normal,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
