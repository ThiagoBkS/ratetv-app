import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/cast.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_cast_card.dart';

class MovieCastSection extends StatelessWidget {
  final List<TMDBCast> castList;
  const MovieCastSection({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: Spacing.extraSmall,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Cast",
                  style: GoogleFonts.montserrat(
                    fontSize: FontSize.large,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("(${castList.length})"),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "View more",
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 196,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (TMDBCast cast in castList)
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: MovieCastCard(
                    imageUrl:
                        "https://media.themoviedb.org/t/p/w300/${cast.profilePath}",
                    character: cast.originalName,
                    originalName: cast.character,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
