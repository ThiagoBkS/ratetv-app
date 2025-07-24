import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/old/models/movie.dart';
import 'package:project_a/old/utils/font_size.dart';
import 'package:project_a/old/utils/spacing.dart';
import 'package:project_a/old/widgets/movie_poster.dart';
import 'package:project_a/old/widgets/movie_section_details.dart';

class MovieHeader extends StatelessWidget {
  final CompleteMovie data;
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
            Flexible(flex: 2, child: MoviePoster(data: data)),
            Expanded(flex: 5, child: MovieSectionDetails(data: data)),
          ],
        ),
        SizedBox(height: Spacing.extraSmall),
        Text(
          "“${data.movie.tagline}”",
          style: GoogleFonts.montserrat(
            fontStyle: FontStyle.italic,
            fontSize: FontSize.normal,
          ),
        ),
        Text(
          data.movie.overview,
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
