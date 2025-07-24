import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MovieBackdrop extends StatelessWidget {
  final String imageUrl;
  const MovieBackdrop({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 0.6,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/$imageUrl",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    color: Color.fromRGBO(56, 63, 68, 0.5),
                    child: Icon(
                      LucideIcons.imageOff300,
                      size: 48,
                      color: Color.fromRGBO(56, 63, 68, 1),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(24, 28, 31, 1),
                  Color.fromRGBO(24, 28, 31, 0.8),
                  Color.fromRGBO(24, 28, 31, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.1, 1, 1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
