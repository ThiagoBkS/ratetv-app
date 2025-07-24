import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/old/models/movie.dart';
import 'package:project_a/old/utils/spacing.dart';

// #001 - App trava quando imagem não carrega
class MoviePoster extends StatelessWidget {
  final CompleteMovie data;
  const MoviePoster({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(Spacing.small),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Image.network(
                "https://image.tmdb.org/t/p/w500/${data.movie.posterPath}",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromRGBO(56, 63, 68, 1),
                    child: Icon(
                      LucideIcons.imageOff300,
                      size: 48,
                      color: Color.fromRGBO(90, 90, 90, 1),
                    ),
                  );
                },
              ),
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
                  icon: Icon(FontAwesomeIcons.bookmark, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
