import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/enums/font_size.dart';

class MovieRatingModel extends StatefulWidget {
  final String movieTitle;
  final String movieImage;
  final int selectedStarIndex;
  final Function(int index) onRate;

  const MovieRatingModel({
    super.key,
    required this.movieTitle,
    required this.movieImage,
    required this.selectedStarIndex,
    required this.onRate,
  });

  @override
  State<StatefulWidget> createState() {
    return MovieRatingModelState();
  }
}

class MovieRatingModelState extends State<MovieRatingModel> {
  late String movieTitle;
  late String movieImage;
  late int selectedStarIndex;
  late Function(int index) onRate;

  @override
  void initState() {
    super.initState();

    movieTitle = widget.movieTitle;
    movieImage = widget.movieImage;
    selectedStarIndex = widget.selectedStarIndex;
    onRate = widget.onRate;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Color.fromRGBO(24, 28, 31, 1),
        padding: EdgeInsets.only(top: 64, bottom: 96),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              "Avaliar: $movieTitle",
              style: GoogleFonts.montserrat(
                fontSize: FontSize.medium,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int index = 0; index < 5; index++)
                  InkWell(
                    onTap: () {
                      int starIndex = selectedStarIndex == index ? -1 : index;

                      setState(() {
                        selectedStarIndex = starIndex;
                      });
                      onRate(starIndex);
                    },
                    child: Builder(
                      builder: (context) {
                        IconData icon = selectedStarIndex >= index
                            ? FontAwesomeIcons.solidStar
                            : FontAwesomeIcons.star;

                        return Icon(icon, size: 24, color: Colors.amber);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
