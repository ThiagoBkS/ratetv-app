import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/widgets/genres_scroll_list.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Genres",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "view more",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ],
        ),
        GenresScrollList(genres: availableGenres),
      ],
    );
  }
}
