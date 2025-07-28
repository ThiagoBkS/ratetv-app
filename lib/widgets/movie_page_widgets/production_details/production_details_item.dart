import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductionDetailsItem extends StatelessWidget {
  final String label;
  final String value;

  const ProductionDetailsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "$label:",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
