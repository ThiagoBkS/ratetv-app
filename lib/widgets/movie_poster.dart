import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MoviePoster extends StatelessWidget {
  final String image;

  const MoviePoster({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Image.network(image),
          Positioned(
            top: 0,
            right: 0,
            height: 48,
            width: 36,
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Color.fromRGBO(56, 63, 68, 0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
              icon: Icon(LucideIcons.bookmark400, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
