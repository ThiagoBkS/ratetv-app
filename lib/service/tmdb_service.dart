import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';
import 'package:project_a/models/tmdb_models/movie_basic.dart';
import 'package:project_a/service/local_cache_service.dart';

class TmdbService {
  static String apiKey = dotenv.get("TMDB_API_KEY");
  static String apiBaseUrl = "https://api.themoviedb.org/3";
  static String imageBaseUrl = "https://image.tmdb.org/t/p/";
  static String defaultImageQuality = "w500";

  static getFullImageSrc(dynamic path) {
    return "$imageBaseUrl$defaultImageQuality${path.toString()}";
  }

  static Future<List<MovieCast>> getMovieCastList(int id) async {
    Uri? uri = Uri.tryParse(
      "$apiBaseUrl/movie/$id/credits?api_key=$apiKey&language=pt-BR",
    );

    if (uri == null) {
      throw FormatException("Unable to get movies by id: $id, malformed URI");
    }

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movies by id: $id, status ${response.statusCode}",
        );
      }

      final data = json.decode(response.body);
      List<dynamic> cast = data["cast"];

      return cast.map((cast) => MovieCast.fromJson(cast)).toList();
    } catch (err) {
      rethrow;
    }
  }

  static Future<Movie> getMovieById(int id) async {
    Uri? uri = Uri.tryParse(
      "$apiBaseUrl/movie/$id?api_key=$apiKey&language=pt-BR",
    );

    if (uri == null) {
      throw FormatException("Unable to get movies by id: $id, malformed URI");
    }

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movies by id: $id, status ${response.statusCode}",
        );
      }

      final data = json.decode(response.body);
      return Movie.fromJson(data);
    } catch (err) {
      rethrow;
    }
  }

  static Future<List<MovieBasic>> getMoviePreviewListByTitle(
    String title,
  ) async {
    Uri? uri = Uri.tryParse(
      "$apiBaseUrl/search/movie?api_key=$apiKey&language=pt-BR&query=$title",
    );

    if (uri == null) {
      throw FormatException(
        "Unable to get movies by title: $title, malformed URI",
      );
    }

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movies by title: $title, status ${response.statusCode}",
        );
      }

      final data = json.decode(response.body);
      final List<dynamic> movies = data["results"];

      return movies.map((json) => MovieBasic.fromJson(json)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
