import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MovieCard extends StatelessWidget {
  final String image;
  const MovieCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          child: Stack(
            children: [
              Image.network(width: double.infinity, image, fit: BoxFit.cover),
              Positioned(
                top: 0,
                right: 0,
                height: 48,
                width: 36,
                child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Color.fromRGBO(24, 20, 35, 0.75),
                    ),
                  ),
                  icon: Icon(LucideIcons.bookmark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
