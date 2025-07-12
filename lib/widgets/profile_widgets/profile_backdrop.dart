import 'package:flutter/material.dart';

class ProfileBackdrop extends StatelessWidget {
  const ProfileBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: AspectRatio(
        aspectRatio: 1 / 0.5,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://4kwallpapers.com/images/walls/thumbs_3t/22855.jpg",
                fit: BoxFit.cover,
              ),
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
  }
}
