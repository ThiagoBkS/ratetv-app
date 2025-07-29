import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/pages/collection_page.dart';
import 'package:project_a/utils/utils.dart';

class GenreScrollListChip extends StatelessWidget {
  final Genre genre;
  const GenreScrollListChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = constraints.maxHeight;
        double radius = 8.0;

        return Material(
          borderRadius: BorderRadius.circular(radius),
          color: Color.fromRGBO(35, 41, 45, 1),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollectionPage()),
              );
            },
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints(
                minWidth: valueOfPercentage(maxHeight, 1.5),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: Color.fromRGBO(46, 54, 60, 1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(
                    genre.icon,
                    color: Color.fromRGBO(185, 194, 201, 1),
                    size: valueOfPercentage(maxHeight, 0.35),
                  ),
                  Text(
                    genre.label,
                    style: GoogleFonts.montserrat(
                      color: Color.fromRGBO(185, 194, 201, 1),
                      fontSize: min(valueOfPercentage(maxHeight, 0.2), 16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
