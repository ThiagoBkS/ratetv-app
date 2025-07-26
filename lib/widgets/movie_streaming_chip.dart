import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';

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
        width: 96,
        child: Column(
          spacing: Spacing.extraSmall,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.small),
                child: Image.network(
                  image,
                  errorBuilder: (context, error, stackTrace) {
                    return Text("opa");
                  },
                ),
              ),
            ),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: FontSize.small,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
