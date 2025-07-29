import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';

class MovieListSection extends StatelessWidget {
  final String label;
  final List<BasicMovie> movies;

  const MovieListSection({
    super.key,
    required this.label,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(movies.length, (index) {
              BasicMovie basicMovie = movies[index];

              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: MovieCard(
                  basicMovie: basicMovie,
                  enableDetailsSheet: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviePage(
                          movieId: basicMovie.id,
                          onBackToMain: () => Navigator.pop(context),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
