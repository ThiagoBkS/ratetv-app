import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/utils/utils.dart';
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
          AutoSizeText(
            data.title,
            maxLines: 2,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          Row(
            spacing: Spacing.extraSmall,
            children: [
              Text(
                formatDate(data.releaseDate),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                "•",
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
              Text(
                Movie.formatRuntime(data.runtime),
                style: GoogleFonts.montserrat(fontSize: FontSize.normal),
              ),
            ],
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(data.genres.length, (index) {
              String label = data.genres[index];
              return GenreChip(label: label);
            }),
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
