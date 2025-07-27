import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_a/models/movie_preview.dart';
import 'package:project_a/utils/utils.dart';
import 'package:project_a/widgets/movie_card/image_error_widget.dart';
import 'package:project_a/widgets/movie_card/movie_details_sheet/movie_details_sheet.dart';

class MovieCard extends StatelessWidget {
  final MoviePreview details;
  final bool enableDetailsSheet;
  final bool enableBookmarked;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.details,
    this.enableDetailsSheet = false,
    this.enableBookmarked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: Container(
            color: Color.fromRGBO(56, 63, 68, 1),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth;
                double maxHeight = constraints.maxHeight;

                return Stack(
                  children: [
                    Image.network(
                      details.posterUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return ImageErrorWidget(label: details.title);
                      },
                    ),

                    if (enableDetailsSheet)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                          onLongPress: () {
                            showMovieDetailsSheet(context, details);
                          },
                        ),
                      ),

                    if (enableBookmarked)
                      Positioned(
                        top: 0,
                        right: 0,
                        width: valueOfGridFlex(maxWidth, 2.5),
                        height: valueOfGridFlex(maxHeight, 2.5),
                        child: IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: Color.fromRGBO(33, 37, 40, 0.95),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                          icon: Icon(FontAwesomeIcons.bookmark, size: 18),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
