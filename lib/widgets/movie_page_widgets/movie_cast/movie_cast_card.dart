import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';

class MovieCastCard extends StatelessWidget {
  final MovieCast cast;

  const MovieCastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.transparent,
            child: AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(56, 63, 68, 0.25),
                  border: Border.all(color: Color.fromRGBO(56, 63, 68, 1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1.25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w200/${cast.image}",
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,

                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  color: Color.fromRGBO(38, 45, 50, 1),
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

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cast.name,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  cast.character,
                                  style: GoogleFonts.montserrat(fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(onTap: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
