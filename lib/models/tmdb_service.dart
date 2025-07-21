import 'dart:convert';

import 'package:project_a/exceptions/not_found_movie.dart';
import 'package:project_a/models/cast.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_movie.dart';
import 'package:http/http.dart' as http;

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
    final String apiKey = "XXXX";
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
