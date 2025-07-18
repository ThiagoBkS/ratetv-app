import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';
import 'package:project_a/enums/spacing.dart';

class MovieStreamingChip extends StatelessWidget {
  final String image;
  final String label;

  const MovieStreamingChip({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(Spacing.extraSmall),
      child: Container(
        padding: EdgeInsets.all(Spacing.small),
        child: Column(
          spacing: Spacing.extraSmall,
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.small),
                child: Image.network(image),
              ),
            ),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: FontSize.small,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
