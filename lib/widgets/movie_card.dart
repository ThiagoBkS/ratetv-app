import 'package:flutter/material.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/widgets/image_error_widget.dart';

class MovieCard extends StatelessWidget {
  final BasicMovie details;
  final VoidCallback onTap;
  final VoidCallback onPress;

  const MovieCard({
    super.key,
    required this.details,
    required this.onTap,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: Stack(
            children: [
              Image.network(
                details.posterUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return ImageErrorWidget(label: details.title);
                },
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onLongPress: () {
                    // showMovieDetailsSheet(context, details);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
