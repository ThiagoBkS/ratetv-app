import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:project_a/exceptions/not_found_movie.dart';
import 'dart:convert';

import 'package:project_a/models/basic_movie.dart';

class TmdbService {
  static final String baseUrl = "https://api.themoviedb.org/3";

  static final String baseUrlImage = "https://image.tmdb.org/t/p/";

  static String getFullImageSrc(String path, String quality) {
    return "$baseUrl$quality$path";
  }

  static String formattedDate(String stringDate) {
    try {
      DateTime date = DateTime.parse(stringDate);
      return DateFormat('dd MMM yyyy', 'pt_BR').format(date);
    } catch (err) {
      return DateTime(0).toString();
    }
  }

  static Future<BasicMovie> getMovieById(
    http.Client client,
    int movieId,
    String apiKey,
  ) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey&language=pt-BR'),
    );

    final data = json.decode(response.body);
    return BasicMovie.fromJson(data);
  }

  static Future<List<BasicMovie>> getMovieByTitle(String title) async {
    final String apiKey = "";

    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/search/movie?api_key=$apiKey&language=pt-BR&query=$title',
        ),
      );

      print(response.body.toString());

      final data = json.decode(response.body);

      final List<dynamic> movies = data["results"];
      return movies.map((json) => BasicMovie.fromJson(json)).toList();
    } catch (err) {
      throw NotFoundMovie("Movie with title: $title not found!");
    }
  }

  // static Future<TMDBMovie> getMovieById(
  //   http.Client client,
  //   int movieId,
  //   String apiKey,
  // ) async {
  //   final response = await client.get(
  //     Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey&language=pt-BR'),
  //   );

  //   requests++;
  //   print(requests);

  //   final data = json.decode(response.body);
  //   return TMDBMovie.fromJson(data);
  // }

  // static Future<List<TMDBCast>> getMovieCastList(
  //   http.Client client,
  //   int movieId,
  //   String apiKey,
  // ) async {
  //   final response = await client.get(
  //     Uri.parse('$baseUrl/movie/$movieId/credits?api_key=$apiKey'),
  //   );

  //   requests++;
  //   print(requests);

  //   final data = json.decode(response.body);
  //   final List<dynamic> castJson = data["cast"];
  //   return castJson.map((json) => TMDBCast.fromJson(json)).toList();
  // }

  // static Future<CompleteMovie> getAllMovieData(int movieId) async {
  //   final String apiKey = "";
  //   var client = http.Client();

  //   requests++;
  //   print(requests);
  //   try {
  //     final movie = await getMovieById(client, movieId, apiKey);
  //     final cast = await getMovieCastList(client, movieId, apiKey);

  //     client.close();
  //     return CompleteMovie(movie: movie, cast: cast);
  //   } catch (err) {
  //     throw NotFoundMovie("Movie with id: $movieId not found!");
  //   }
  // }
}
