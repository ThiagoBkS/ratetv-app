import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';
import 'package:project_a/enums/spacing.dart';
import 'package:project_a/models/platform.dart';
import 'package:project_a/widgets/movie_streaming_chip.dart';

class MovieStreamingPlatforms extends StatelessWidget {
  final List<StreamingPlatform> platforms;
  const MovieStreamingPlatforms({super.key, required this.platforms});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              for (StreamingPlatform platform in platforms)
                MovieStreamingChip(
                  image: platform.image,
                  label: platform.label,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
