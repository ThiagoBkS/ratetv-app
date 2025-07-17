import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';
import 'package:project_a/enums/spacing.dart';
import 'package:project_a/widgets/movie_poster.dart';

class MovieSimilarsSection extends StatelessWidget {
  const MovieSimilarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: Spacing.extraSmall,
          children: [
            Text(
              "Filmes Similares",
              style: GoogleFonts.montserrat(
                fontSize: FontSize.large,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: List.generate(10, (index) {
              return MoviePoster(
                image: "https://placehold.co/100x150/EEE/31343C.jpg",
              );
            }),
          ),
        ),
      ],
    );
  }
}

class MovieSimilarCard extends StatelessWidget {
  final String image;
  const MovieSimilarCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 72,
                width: 144,
                child: Image.network(image),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Homem Aranha",
              style: GoogleFonts.montserrat(fontSize: FontSize.small),
            ),
          ],
        ),
      ),
    );
  }
}
