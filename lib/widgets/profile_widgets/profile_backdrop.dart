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
                "https://placehold.co/100x150/EEE/31343C.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(18, 18, 18, 1), Colors.transparent],
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
