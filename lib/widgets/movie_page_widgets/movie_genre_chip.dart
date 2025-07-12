import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieGenreChip extends StatelessWidget {
  final String label;
  const MovieGenreChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: BoxBorder.all(color: Color.fromRGBO(60, 60, 60, 1)),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey[50],
          ),
        ),
      ),
    );
  }
}
