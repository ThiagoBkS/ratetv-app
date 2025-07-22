import 'dart:convert';

import 'package:project_a/exceptions/not_found_movie.dart';
import 'package:project_a/models/cast.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_movie.dart';
import 'package:http/http.dart' as http;
import 'package:project_a/models/tmdb_search_result.dart';

class TmdbService {
  static final String baseUrl = "https://api.themoviedb.org/3";

  static Future<TMDBMovie> getMovieById(
    http.Client client,
    int movieId,
    String apiKey,
  ) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey&language=pt-BR'),
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
      Uri.parse('$baseUrl/movie/$movieId/credits?api_key=$apiKey'),
    );

    final data = json.decode(response.body);
    final List<dynamic> castJson = data["cast"];
    return castJson.map((json) => TMDBCast.fromJson(json)).toList();
  }

  static Future<CompleteMovie> getAllMovieData(int movieId) async {
    final String apiKey = "9d005c81618cf4d45a9f6977b2d85774";
    var client = http.Client();

    try {
      final movie = await getMovieById(client, movieId, apiKey);
      final cast = await getMovieCastList(client, movieId, apiKey);

      client.close();
      return CompleteMovie(movie: movie, cast: cast);
    } catch (err) {
      throw NotFoundMovie("Movie with id: $movieId not found!");
    }
  }

  static Future<List<TMDBSearchResult>> getMovieByTitle(String title) async {
    final String apiKey = "";

    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/search/movie?api_key=$apiKey&language=pt-BR&query=$title',
        ),
      );

      final data = json.decode(response.body);
      final List<dynamic> movies = data["results"];
      return movies.map((json) => TMDBSearchResult.fromJson(json)).toList();
    } catch (err) {
      throw NotFoundMovie("Movie with title: $title not found!");
    }
  }
}
