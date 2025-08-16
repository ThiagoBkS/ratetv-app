import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/utils/utils.dart';
import 'package:project_a/widgets/movie_card/image_error_widget.dart';
import 'package:project_a/widgets/movie_card/movie_details_sheet/movie_details_sheet.dart';

class MovieCard extends StatelessWidget {
  final BasicMovie basicMovie;
  final bool enableDetailsSheet;
  final bool enableBookmarked;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.basicMovie,
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
                      basicMovie.posterUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return ImageErrorWidget(label: basicMovie.title);
                      },
                    ),

                    if (enableDetailsSheet)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                          onLongPress: () {
                            showMovieDetailsSheet(context, basicMovie);
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
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${basicMovie.title} adicionado para assitir mais tarde!',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Color.fromRGBO(56, 63, 68, 1),
                                elevation: 4,
                              ),
                            );
                          },
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

                    if (basicMovie.isWatched)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        width: valueOfGridFlex(maxWidth, 2.5),
                        height: valueOfGridFlex(maxWidth, 2.5),
                        child: IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: Color.fromRGBO(33, 37, 40, 0.95),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                          icon: Row(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.check,
                                size: 14,
                                color: Colors.blue,
                              ),
                              // Text(
                              //   "8.3",
                              //   style: GoogleFonts.montserrat(fontSize: 12.sp),
                              // ),
                            ],
                          ),
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
