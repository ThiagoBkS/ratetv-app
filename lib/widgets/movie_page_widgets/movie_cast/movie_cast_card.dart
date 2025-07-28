import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MovieCastCard extends StatelessWidget {
  final String imageUrl;
  final String character;
  final String originalName;

  const MovieCastCard({
    super.key,
    required this.imageUrl,
    required this.character,
    required this.originalName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 104,
          decoration: BoxDecoration(
            color: Color.fromRGBO(56, 63, 68, 0.25),
            border: Border.all(color: Color.fromRGBO(56, 63, 68, 1)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1.25,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
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
                      ;
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalName,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      character,
                      style: GoogleFonts.montserrat(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
