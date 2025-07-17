import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/enums/spacing.dart';

class MoviePoster extends StatelessWidget {
  final String image;

  const MoviePoster({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(Spacing.small),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Image.network(image),
            Positioned(
              top: -1,
              right: -1,
              height: 48,
              width: 36,
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromRGBO(24, 28, 31, 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Spacing.small),
                    ),
                  ),
                ),
                icon: Icon(LucideIcons.bookmark400, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
