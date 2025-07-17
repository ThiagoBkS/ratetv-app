import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';
import 'package:project_a/enums/spacing.dart';
import 'package:project_a/widgets/movie_cast_card.dart';

class MovieCastSection extends StatelessWidget {
  const MovieCastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: Spacing.extraSmall,
          children: [
            Text(
              "Cast",
              style: GoogleFonts.montserrat(
                fontSize: FontSize.large,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text("(12)"),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return MovieCastCard(
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png",
              );
            }),
          ),
        ),
      ],
    );
  }
}
