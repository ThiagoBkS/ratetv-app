import 'package:flutter/material.dart';

class MovieBackdrop extends StatelessWidget {
  final String image;
  const MovieBackdrop({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.15,
      child: AspectRatio(
        aspectRatio: 1 / 0.5,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(image, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(21, 21, 29, 1), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
