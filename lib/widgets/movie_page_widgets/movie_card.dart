import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  const MovieCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          height: 48,
          width: 40,
          child: IconButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                Color.fromRGBO(24, 20, 35, 0.75),
              ),
            ),
            icon: Icon(
              color: Color.fromRGBO(175, 175, 175, 1),
              Icons.bookmark_border_rounded,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
