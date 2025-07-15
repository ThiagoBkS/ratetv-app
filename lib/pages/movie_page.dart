import 'package:flutter/material.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/widgets/movie_backdrop.dart';
import 'package:project_a/widgets/movie_content.dart';

class MoviePage extends StatelessWidget {
  final Movie movie = Movie(
    backdropImage: "https://placehold.co/100x100/EEE/31343C.jpg",
    posterPath: "https://placehold.co/100x100/EEE/31343C.jpg",
    title: "",
    releaseDate: "",
    runtime: "",
    tagline: "",
    overview: "",
    genres: [
      Genre(label: ""),
      Genre(label: ""),
      Genre(label: ""),
    ],
  );

  MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                MovieBackdrop(image: movie.backdropImage),
                MovieContent(movie: movie),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
