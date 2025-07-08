import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelChip extends StatelessWidget {
  final String label;
  const LabelChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(64, 64, 64, 0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
      child: Text(
        label,
        style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
