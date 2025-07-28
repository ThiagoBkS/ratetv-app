import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/streaming_service.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_streaming/movie_streaming_chip.dart';

class MovieAvaliableStreamings extends StatelessWidget {
  final Movie data;
  MovieAvaliableStreamings({super.key, required this.data});

  final List<dynamic> providers = [
    {
      "logo_path": "/97yvRBw1GzX7fXprcF80er19ot.jpg",
      "provider_id": 337,
      "provider_name": "Disney Plus",
      "display_priority": 0,
    },
    {
      "logo_path": "/7EpFKOCMrlo3bjsyBMrec64c7Wb.jpg",
      "provider_id": 484,
      "provider_name": "Claro tv+",
      "display_priority": 23,
    },
    {
      "logo_path": "/9kcTsX2laYclN4bFiMH3RuhZel2.jpg",
      "provider_id": 2156,
      "provider_name": "Telecine Amazon Channel",
      "display_priority": 87,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<StreamingService> provider = providers
        .map((json) => StreamingService.fromJson(json))
        .toList();

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Spacing.medium,
        children: [
          Text(
            "Onde assitir?",
            style: GoogleFonts.montserrat(
              fontSize: FontSize.large,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: Wrap(
              spacing: Spacing.extraSmall,
              runSpacing: Spacing.extraSmall,
              children: [
                for (StreamingService platform in provider)
                  MovieStreamingChip(
                    image: platform.logo,
                    label: platform.name,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
