import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/data_label.dart';

class InfoItem extends StatelessWidget {
  final DataLabel data;
  const InfoItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "${data.label}:",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            data.value,
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
