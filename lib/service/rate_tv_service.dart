import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/models/tmdb_models/movie.dart';

class RateTvService {
  static final String basicUrl = "http://192.168.15.3:8080";

  static Future<List<BasicMovie>> getWatchedMovies(String publicId) async {
    final uri = Uri.tryParse("$basicUrl/watched/user/$publicId");

    if (uri == null) {
      throw FormatException(
        "Unable to get movie by ID: $publicId, malformed URI",
      );
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movie by ID: $publicId, status ${response.statusCode}",
        );
      }

      final List<dynamic> data = json.decode(response.body);

      return data.map((item) => BasicMovie.fromJson(item)).toList();
    } catch (err) {
      print("Error fetching movie by ID $publicId: $err");
      rethrow;
    }
  }

  static Future<Movie> getMovieById(int id) async {
    final uri = Uri.tryParse("$basicUrl/api/movie/$id");

    if (uri == null) {
      print("opa");
      throw FormatException("Unable to get movie by ID: $id, malformed URI");
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movie by ID: $id, status ${response.statusCode}",
        );
      }

      final data = json.decode(response.body);
      return Movie.fromJson(data);
    } catch (err) {
      print("Error fetching movie by ID $id: $err");
      rethrow;
    }
  }

  static Future<Movie> getMovieByTmdbId(int id) async {
    final uri = Uri.tryParse("$basicUrl/api/movie/external/tmdb/$id");

    if (uri == null) {
      print("opa");
      throw FormatException("Unable to get movie by ID: $id, malformed URI");
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movie by ID: $id, status ${response.statusCode}",
        );
      }

      final data = json.decode(response.body);
      return Movie.fromJson(data);
    } catch (err) {
      print("Error fetching movie by ID $id: $err");
      rethrow;
    }
  }

  static Future<List<BasicMovie>> getMoviesByGenre(int id) async {
    final uri = Uri.tryParse("$basicUrl/api/movie/genre/$id");

    if (uri == null) {
      throw FormatException("Unable to get movie by ID: $id, malformed URI");
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movie by ID: $id, status ${response.statusCode}",
        );
      }
      final List<dynamic> data = json.decode(response.body);
      print(response.body);

      return data.map((item) => BasicMovie.fromJson(item)).toList();
    } catch (err) {
      print("Error fetching movie by ID $id: $err");
      rethrow;
    }
  }

  static Future<http.Response> sendWatchedMovie(int movieId) {
    try {
      final url = Uri.parse('$basicUrl/watched/add');

      final body = jsonEncode({
        "user_id":
            "d6fc1650553d0b6cb60b5ccd4eb8aeb62f12320e39a767e1d6087e523d5ee2fa",
        "movie_id": movieId,
      });

      return http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (err) {
      rethrow;
    }
  }

  static Future<List<BasicMovie>> getCollectionItems(int collectionId) async {
    final uri = Uri.tryParse("$basicUrl/collection/$collectionId");

    if (uri == null) {
      throw FormatException(
        "Unable to get movie by ID: $collectionId, malformed URI",
      );
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw HttpException(
          "Unable to get movie by ID: $collectionId, status ${response.statusCode}",
        );
      }

      final List<dynamic> data = json.decode(response.body);

      return data.map((item) => BasicMovie.fromJson(item)).toList();
    } catch (err) {
      print("Error fetching movie by ID $collectionId: $err");
      rethrow;
    }
  }
}
