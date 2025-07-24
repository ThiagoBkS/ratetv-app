import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/old/utils/utils.dart';

class MovieDetailsPoster extends StatelessWidget {
  final String posterImage;
  const MovieDetailsPoster({super.key, required this.posterImage});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;

          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Container(
              color: Color.fromRGBO(56, 63, 68, 1),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.network(
                    posterImage,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        LucideIcons.imageOff200,
                        color: Color.fromRGBO(82, 91, 97, 1),
                        size: valueOfPercentage(maxWidth, 0.45),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
