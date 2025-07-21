import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String label;

  const InfoRow({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Spacing.extraSmall,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: FontSize.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label, style: GoogleFonts.montserrat(fontSize: FontSize.normal)),
      ],
    );
  }
}
