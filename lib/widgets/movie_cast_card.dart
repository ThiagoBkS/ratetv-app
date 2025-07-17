import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';

class MovieCastCard extends StatelessWidget {
  final String image;
  const MovieCastCard({super.key, required this.image});

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
                width: 72,
                child: Image.network(image),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Jane Doe.",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: FontSize.normal,
              ),
            ),
            Text(
              "John Doe.",
              style: GoogleFonts.montserrat(fontSize: FontSize.small),
            ),
          ],
        ),
      ),
    );
  }
}
