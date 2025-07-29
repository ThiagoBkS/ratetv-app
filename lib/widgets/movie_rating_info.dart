import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_a/utils/spacing.dart';

class MovieRatingInfo extends StatelessWidget {
  final double voteAverage;
  final int voteCount;

  const MovieRatingInfo({
    super.key,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color.fromRGBO(222, 181, 34, 1),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: Spacing.extraSmall,
          children: [
            Text(
              "${NumberFormat("#,##0.0", "pt_BR").format(voteAverage)}/10",
              style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
            ),
            Text(
              "(${NumberFormat.decimalPattern('pt_BR').format(voteCount)})",
              style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
