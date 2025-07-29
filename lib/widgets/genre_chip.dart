import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/utils/palette.dart';

class GenreChip extends StatelessWidget {
  final String label;
  const GenreChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        decoration: BoxDecoration(
          color: Palette.borderColor,
          border: BoxBorder.all(color: Palette.placeholderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
