import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_a/exceptions/not_found_movie.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/models/cast.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_movie.dart';

class TmdbService {
  static final String baseUrl = "https://api.themoviedb.org/3";

  static Future<TMDBMovie> getMovieById(
    http.Client client,
    int movieId,
    String apiKey,
  ) async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR',
      ),
    );

    final data = json.decode(response.body);
    return TMDBMovie.fromJson(data);
  }

  static Future<List<TMDBCast>> getMovieCastList(
    http.Client client,
    int movieId,
    String apiKey,
  ) async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey',
      ),
    );

    final data = json.decode(response.body);
    final List<dynamic> castJson = data["cast"];
    return castJson.map((json) => TMDBCast.fromJson(json)).toList();
  }

  static Future<List<BasicMovie>> getMovieByTitle(String title) async {
    final String apiKey = "";

    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/search/movie?api_key=$apiKey&language=pt-BR&query=$title',
        ),
      );

      final data = json.decode(response.body);

      final List<dynamic> movies = data["results"];
      return movies.map((json) => BasicMovie.fromJson(json)).toList();
    } catch (err) {
      throw NotFoundMovie("Movie with title: $title not found!");
    }
  }

  static Future<CompleteMovie> getAllMovieData(int movieId) async {
    // return CompleteMovie(
    //   movie: TMDBMovie(
    //     adult: false,
    //     backdropPath: "",
    //     budget: 0,
    //     genres: [],
    //     id: 1,
    //     imdbId: "",
    //     overview: "wew",
    //     posterPath: "",
    //     releaseDate: DateTime(0),
    //     revenue: 0,
    //     runtime: 0,
    //     tagline: "",
    //     title: "",
    //     voteAverage: 0,
    //     voteCount: 0,
    //   ),
    //   cast: [],
    // );

    final String apiKey = "";
    var client = http.Client();

    try {
      final movie = await getMovieById(client, movieId, apiKey);
      final cast = await getMovieCastList(client, movieId, apiKey);

      return CompleteMovie(movie: movie, cast: cast);
    } catch (err) {
      throw NotFoundMovie("Movie with id: $movieId not found!");
    }
  }
}
