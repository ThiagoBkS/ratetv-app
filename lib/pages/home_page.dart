import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project_a/exceptions/error_message.dart';
import 'package:project_a/models/basic_collection.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/service/rate_tv_service.dart';
import 'package:project_a/widgets/collection_card/collection_card.dart';
import 'package:project_a/widgets/home_widgets/genres_section.dart';
import 'package:project_a/widgets/movie_list_section.dart';

import 'package:http/http.dart' as http;
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HomePage extends StatefulWidget {
  final Function(int movieId) onMovieSelected;
  const HomePage({super.key, required this.onMovieSelected});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class HomeSection {
  final String title;
  final List<BasicMovie> movies;

  const HomeSection({required this.title, required this.movies});
}

class _HomePageState extends State<HomePage> {
  List<String> genres = [
    "Action",
    "Comedy",
    "Science Fiction",
    "Adventure",
    "Fantasy",
    "Drama",
    "Horror",
    "Thriller",
    "Romance",
    "Documentary",
  ];

  late Future<List<HomeSection>> sections;

  late ErrorMessage? error;

  @override
  void initState() {
    super.initState();
    sections = fetchAllGenres();
  }

  Future<List<HomeSection>> fetchAllGenres() async {
    Map<int, String> genres = {
      1: "Action",
      2: "Comedy",
      3: "Science Fiction",
      4: "Adventure",
      5: "Fantasy",
      6: "Drama",
      7: "Horror",
      8: "Thriller",
      9: "Romance",
      10: "Documentary",
    };

    List<HomeSection> hm = [];

    List<Future<List<BasicMovie>>> futures = genres.keys
        .map((id) => getMoviesByGenre(id))
        .toList();

    List<List<BasicMovie>> moviesList = await Future.wait(futures);

    for (int i = 0; i < genres.length; i++) {
      hm.add(
        HomeSection(
          title: genres[genres.keys.elementAt(i)]!,
          movies: moviesList[i],
        ),
      );
    }

    return hm;
  }

  Future<List<BasicMovie>> getMoviesByGenre(int genreId) async {
    try {
      List<BasicMovie> x = await RateTvService.getMoviesByGenre(genreId);
      return x;
    } catch (err) {
      error = ErrorMessage(title: "Ops!", message: err.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            GenresSection(),

            SizedBox(height: 16.h),

            SizedBox(
              width: double.infinity,
              height: 200,
              child: CollectionCard(
                collection: Collection(
                  title: "Os 100 filmes mais bem avaliados",
                  description:
                      "Os maiores sucessos do cinema, segundo a avaliação do público e da crítica.",
                  backdropUrl:
                      "https://image.tmdb.org/t/p/w1280/41xIKcLiM5ryfz4C9sZFcBOJGsK.jpg",
                ),
                color: Color.fromRGBO(20, 27, 34, 1),
              ),
            ),

            SizedBox(height: 16.h),

            FutureBuilder<List<HomeSection>>(
              future: sections,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: Color.fromRGBO(135, 206, 235, 1),
                      size: 48,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Text("Erro: ${snapshot.error}");
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text("Nenhum dado disponível");
                }
                return Column(
                  children: snapshot.data!.map((section) {
                    return MovieListSection(
                      label: section.title,
                      movies: section.movies,
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
