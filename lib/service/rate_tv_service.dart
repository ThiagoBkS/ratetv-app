import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_a/models/tmdb_models/movie.dart';

class RateTvService {
  static Future<Movie> getMovieByTmdbId(int id) async {
    final uri = Uri.tryParse(
      "http://192.168.15.7:8080/api/movie/external/tmdb/$id",
    );

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
}
