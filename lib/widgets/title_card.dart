import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final bool isBookmarked = false;
  final String imageURL;
  final double borderRadiusValue = 8;

  const TitleCard({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Color.fromRGBO(46, 46, 54, 0.75), width: 2),
      ),
      height: double.infinity,
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageURL,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromRGBO(46, 46, 54, 1),
                    child: Icon(
                      Icons.broken_image,
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                      size: 34,
                    ),
                  );
                },
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: -1,
              right: -1,
              height: 48,
              width: 40,
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadiusValue),
                        topRight: Radius.circular(borderRadiusValue),
                      ),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Color.fromRGBO(24, 20, 35, 0.75),
                  ),
                ),
                icon: Icon(
                  color: Color.fromRGBO(175, 175, 175, 1),
                  isBookmarked
                      ? Icons.bookmark_added_rounded
                      : Icons.bookmark_border_rounded,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
