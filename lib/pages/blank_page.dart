import 'package:flutter/material.dart';
import 'package:project_a/models/production/movie_production.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_cast/movie_cast_card.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_cast/movie_cast_section.dart';
import 'package:project_a/widgets/movie_page_widgets/production_details/movie_production_details.dart';

class BlankPage extends StatelessWidget {
  BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              MovieCastSection(
                castList: [
                  MovieCast(
                    id: 1,
                    character: "John Wick",
                    image: "https://example.com/wick.jpg",
                    name: "Keanu Reeves",
                  ),
                  MovieCast(
                    id: 2,
                    character: "Black Widow",
                    image: "https://example.com/widow.jpg",
                    name: "Scarlett Johansson",
                  ),
                  MovieCast(
                    id: 3,
                    character: "Iron Man",
                    image: "https://example.com/ironman.jpg",
                    name: "Robert Downey Jr.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
